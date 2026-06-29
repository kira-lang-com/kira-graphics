# Architecture

Kira Graphics is organized around a stable public facade, explicit descriptor data, a runtime/validation core, and a hidden Sokol backend implementation.

## Layers

`app/Public/`

- user-facing API objects and handles such as `GraphicsApplication`, `Graphics`, `GraphicsFrame`, `RenderEncoder`, `GraphicsBuffer`, `GraphicsTexture`, `GraphicsShader`, and `RenderPipeline`
- compiler-safe Int helper constants in `Constants.kira`
- lifecycle callback surface that examples import directly through `KiraGraphics`

`app/Core/`

- runtime flow from lifecycle callbacks to frame submission
- validation helpers such as `graphicsValidatePipeline`, `graphicsValidateBuffer`, and `graphicsValidateTexture`
- diagnostics and bookkeeping that should stay backend-agnostic

`app/Resources/` and `app/Shader/`

- descriptor-first value data for buffers, textures, pipelines, and render passes
- KSL path helper descriptors without exposing raw backend asset APIs

`app/Backend/`

- opaque backend handle types
- Sokol-specific translation and submission logic in `app/Backend/Sokol/`
- all raw `sg_*` and `sapp_*` usage stays here or in the explicit raw interop example

## Why The Pass Model Is Descriptor-First

A render pass is not just a clear color. It owns attachment targets, load/store actions, resolve intent, and depth/stencil participation. That matters for both 3D rendering and advanced UI/effects foundations.

Because of that, the public API is built around `RenderPassDescriptor` with explicit `ColorAttachment`, `DepthAttachment`, and `StencilAttachment` data. The older clear-color-only compatibility helpers still exist, but they map into the descriptor-first pass model instead of replacing it.

## Why The Core Encoder Stays Generic

Kira UI Foundation is expected to be a client of Kira Graphics, not the definition of Kira Graphics. The core encoder therefore exposes generic pipeline/buffer/indexed draw operations instead of UI-specific methods like panel draws or glow passes.

That preserves room for:

- 3D scenes and engine rendering
- depth-enabled geometry
- post-processing and offscreen pipelines
- UI/effects renderers built on the same buffer/pipeline/pass foundation

## Current Compiler Constraints

The implementation pass follows `docs/api-preflight-report.md` directly. The important current constraints are:

- enum-backed descriptor defaults are not yet reliable, so public descriptors use Int helper functions
- typed empty array defaults are not reliable, so descriptor arrays are always explicitly populated
- array-of-struct literals require commas between elements
- `[Int]` is used for public index data instead of `[U16]` or `[U32]`
- trailing render-pass callbacks are viable only when captured state members are first hoisted into local aliases

The local-alias rule is the public guidance today:

```kira
let pipeline = state.pipeline
let vertices = state.vertices

frame.renderPass(pass) { encoder in
    encoder.setPipeline(pipeline)
    encoder.setVertexBuffer(vertices)
    encoder.draw(3)
}
```

Direct `state.pipeline`-style capture inside the render-pass callback body is still not safe.

## Current Backend Scope

The Sokol backend now translates a strong honest subset of the descriptor data:

- real float vertex buffers
- real `[Int]` index buffers, currently consumed as uint32 index buffers
- vertex layout translation for the first four attributes
- one active color target in pass submission
- one active color target in pipeline translation
- depth texture creation for depth-enabled passes
- indexed and non-indexed draw submission with instance counts

Fields that are stored publicly but not fully enforced yet should stay documented as deferred limitations instead of being hidden.

## Future Migration Path

The public descriptor shapes are meant to survive the next compiler step. The planned migration is:

1. replace Int-returning constant helpers with enum-backed descriptor values once `kirac` supports them reliably
2. remove the local-alias callback rule once direct outer-member capture is sound
3. expand backend coverage for multiple color attachments, resolve targets, richer texture usage, samplers, bind groups, and view-level attachment control

That path keeps today’s compiler-safe API honest while preserving the intended long-term graphics architecture.

## The Metal Backend (no shim)

`GraphicsBackend.Metal` is a from-scratch Metal backend for Apple platforms,
selected per-platform alongside Sokol (which still serves Windows/Linux/Web). It
replaces the legacy OpenGL path used by Sokol on macOS with a real `CAMetalLayer`
surface.

Crucially it uses **no C or Objective-C shim**. The backend drives Metal,
QuartzCore and AppKit/UIKit *directly* from Kira through FFI to the Objective-C
runtime — `objc_getClass`, `sel_registerName`, and typed `objc_msgSend` aliases —
plus the single Metal C entry point `MTLCreateSystemDefaultDevice`. `app/Backend/
Metal/MetalForeign.kira` is the entire foreign surface; everything else
(`MetalContext`, `MetalResources`, `MetalTexture`, `MetalBindGroup`, `MetalFrame`,
`MetalApplication`) is ordinary Kira. `NativeLibs/Metal.toml` is a source-less
descriptor that only links the system frameworks.

Because the Metal API is Objective-C *messages* rather than C functions, the
foreign surface is hand-authored (one typed `objc_msgSend` alias per call shape);
there is no C header to autobind, which is what autobinding (used for Sokol/Vulkan)
requires.

The context is a small raw heap block threaded as a `RawPtr` handle. It owns the
`MTLDevice`/`MTLCommandQueue`, the current color target (an offscreen `MTLTexture`
for headless tests, or a `CAMetalLayer` drawable on screen), the in-flight command
buffer + encoder, an optional `Depth32Float` target + depth-stencil state, and a
small id→pointer registry that maps the public U32 resource handles to live Metal
objects. Resource creation and draw encoding are dispatched by backend from the
public `Graphics`/`RenderEncoder` facade; the encoder selects Metal mode by the
presence of a non-null context handle.

Implemented and verified (via the `tests/metal_kik` Test harness, which renders
real frames offscreen and asserts the produced pixels):

- color clear and `CAMetalLayer` drawable present
- runtime MSL shader compilation, render pipeline state, vertex + index buffers
- non-indexed and indexed draws
- uniform buffers bound to the vertex and fragment stages
- depth buffer + depth-tested passes (`Depth24Stencil8` requests map to
  `Depth32Float`, which is what Apple GPUs support)
- textures + samplers, and bind groups mapping uniforms/textures/samplers to slots

Run the suite with:

```
KIRA_PURE_TEST=1 kira test --backend hybrid tests/metal_kik
```

The remaining work is the on-screen host integration: attaching the
`CAMetalLayer` to the runner-provided `NSView`/`UIView` and driving frames from the
platform run loop, then making Metal the default Apple backend and retiring Sokol's
Apple targets. The drawable render + present path itself is already proven; only the
window/run-loop host glue and on-device verification remain.
