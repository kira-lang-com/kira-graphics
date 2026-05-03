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
