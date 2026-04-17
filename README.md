# Kira Graphics

Kira Graphics is now shaped around a broader rendering foundation rather than a narrow immediate-mode 2D helper layer. The public surface models resources, passes, frames, encoders, bind groups, render packets, transient upload slices, and a small 2D packet layer while keeping Kira UI out of the dependency graph.

The real backend path today is still Sokol GFX through the existing native bridge:

- Sokol App and Sokol Glue create the window and swapchain.
- Sokol GFX performs setup, shader creation, pipeline creation, buffer creation, pass begin/end, pipeline binding, vertex-buffer binding, draw submission, and commit.
- KSL shader assets are loaded from generated GLSL plus reflection JSON.

The current executable compiler can build the compatibility `Scene` path and validate the new frame/pass/encoder API with `kira check`. Full block-style frame syntax such as `Graphics.frame { frame in ... }` and direct LLVM lowering of the richer value-returning API need compiler work in `../Kirac`; this repo does not modify Kirac.

## Core API

The main Kira-facing surface lives in `app/Core/GraphicsApi.kira` and includes:

- math and sizing values: `Float2`, `Float3`, `Float4`, `Float4x4`, `Rect`, `ScissorRect`, `Viewport`, `WindowSize`, `TextureSize`
- typed graphics values: texture formats, usages, load/store actions, primitive and index types, culling, winding, filters, address modes, shader stage sets
- resources: `GraphicsBuffer`, `GraphicsTexture`, `GraphicsSampler`, `GraphicsShader`, `RenderPipeline`, `ComputePipeline`, `BindGroupLayout`, `BindGroup`, `RenderTarget`
- pass descriptions: `ColorAttachmentDescriptor`, `DepthAttachmentDescriptor`, `RenderPassDescriptor`, `ComputePassDescriptor`, `CopyPassDescriptor`
- submission objects: `GraphicsFrame`, `RenderEncoder`, `ComputeEncoder`, `CopyEncoder`, `FrameSubmission`
- packet layer: `RenderPacket`, `RenderPacketList`
- transient upload slices: `uploadTransientVertexData`, `uploadTransientIndexData`, `uploadTransientUniformData`
- 2D foundation: `Renderer2D`, `QuadMesh`, textured and colored quad packet creation

The API avoids string command tags and stringly resource kinds. Where the current compiler cannot lower enum payloads or namespace-style static values yet, the surface uses typed wrapper values with integer payloads.

## Examples

Buildable Sokol/KSL runtime path:

```powershell
kira build examples/ksl_triangle
```

Frame/pass/encoder API shape check:

```powershell
kira check examples/frame_api_triangle
```

The frame API example uses the new model:

```kira
let graphics: Graphics = Graphics()
let frame: GraphicsFrame = graphics.frame()
let renderPass: RenderPassDescriptor = graphics.makeSwapchainPass(clearColor)
let renderEncoder: RenderEncoder = createRenderEncoderForPass(renderPass)
renderEncoder.setPipeline(pipeline)
renderEncoder.setVertexBuffer(vertexBuffer, 0, 0)
renderEncoder.draw(3)
frame.commitRenderPass(renderPass, renderEncoder)
frame.present()
```

The final block form remains the intended Kira surface once executable block callbacks are available in Kirac.

## Tests

Run the KSL reflection/runtime integration checks:

```powershell
powershell -ExecutionPolicy Bypass -File tests/run_ksl_integration.ps1
```

That script verifies reflection inspection fixtures, builds `examples/ksl_triangle`, and checks `examples/frame_api_triangle`.

## Current Limitations

- `Graphics.frame { frame in ... }` block syntax is not executable today.
- Direct `kira build examples/frame_api_triangle` currently fails with `UnsupportedExecutableFeature` because Kirac cannot lower the richer value-returning frame API into the shared executable IR yet.
- Runtime bind group resource application is represented in the Kira API but still simplified in the Sokol bridge.
- Compute and copy passes are part of the public model but are not executed on the current GLSL 330 Sokol path.
- Offscreen targets are described by the API; swapchain rendering is the working backend path today.
