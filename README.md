<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/KiraGraphicsBannerDark.png">
  <source media="(prefers-color-scheme: light)" srcset="Images/KiraGraphicsBannerLight.png">
  <img alt="Kira Graphics" src="Images/KiraGraphicsBannerLight.png">
</picture>

# Kira Graphics

Kira Graphics is a general-purpose graphics foundation for Kira, not a UI-only renderer. The public API is aimed at real 3D rendering, engine-style frame encoding, post-processing foundations, and future UI/effects layers that sit on top of the same explicit graphics model.

Public applications import `KiraGraphics`, configure a `GraphicsApplication`, attach lifecycle callbacks with trailing blocks, store app state with `nativeState` / `nativeUserData` / `nativeRecover<T>`, create real buffers and pipelines during init, and encode work through descriptor-first render passes and `RenderEncoder`.

Raw Sokol remains available for backend work and the explicit interop sample, but normal public examples should not expose it.

## Public API

The current public slice includes:

- `GraphicsApplication` lifecycle callbacks:
  `app.onInit { graphics in ... }`
  `app.onFrame { frame in ... }`
  `app.onCleanup { graphics in ... }`
- real `GraphicsBuffer` creation for float vertex data and `[Int]` index data
- real `GraphicsTexture` creation for depth attachments and future render targets
- descriptor-first `RenderPipelineDescriptor`
- descriptor-first `RenderPassDescriptor` with color and depth attachments
- `RenderEncoder` methods for `setPipeline`, `setVertexBuffer`, `setIndexBuffer`, `draw`, `drawIndexed`, `drawInstanced`, and `drawIndexedInstanced`
- `createShader(ShaderDescriptor)` and `createShaderFromKsl(KslShaderDescriptor)`

The preferred pass style is:

```kira
let pipeline = state.pipeline
let vertices = state.vertices

frame.renderPass(pass) { encoder in
    encoder.setPipeline(pipeline)
    encoder.setVertexBuffer(vertices)
    encoder.draw(3)
}
```

The local alias step is important today. Direct `state.member` capture inside the trailing render-pass block is still unsafe with the current compiler.

## Compiler-Safe Descriptor Values

The repo currently uses public Int-returning helper functions instead of enum-backed descriptor values. Examples:

- `bufferUsageVertex()`
- `vertexFormatFloat3()`
- `textureFormatDepth24Stencil8()`
- `primitiveTopologyTriangleList()`
- `compareFunctionLessEqual()`

This is a deliberate temporary surface based on `docs/api-preflight-report.md`. Once `kirac` supports enum-backed descriptor defaults and related typing reliably, the API can migrate from these Int constants to real enums without changing the overall architecture.

## Source Layout

```text
app/
  Public/
    BindGroup.kira
    Buffer.kira
    Color.kira
    Constants.kira
    Frame.kira
    Graphics.kira
    Pipeline.kira
    RenderEncoder.kira
    Sampler.kira
    Shader.kira
    Texture.kira
    Types.kira
    Uniform.kira
  Core/
    Diagnostics.kira
    FrameLifecycle.kira
    GraphicsRuntime.kira
    HandleTable.kira
    ResourceRegistry.kira
    Validation.kira
  Backend/
    Backend.kira
    BackendTypes.kira
    Sokol/
      SokolApplication.kira
      SokolBackend.kira
      SokolBuffer.kira
      SokolConversions.kira
      SokolFrame.kira
      SokolPipeline.kira
      SokolShader.kira
      SokolTexture.kira
  Resources/
    BufferDescriptor.kira
    PipelineDescriptor.kira
    RenderPassDescriptor.kira
    TextureDescriptor.kira
  Shader/
    KslShaderDescriptor.kira
    ShaderDescriptor.kira
    ShaderSource.kira
  App/
    AppConfig.kira
    NativeStateBridge.kira
```

`Public/` is the user-facing facade. `Core/` owns runtime flow, validation, and diagnostics. `Backend/` owns the backend abstraction and Sokol implementation. `Resources/` and `Shader/` hold the descriptor-first surface. `App/` owns lifecycle registration and callback-state bridging.

## Examples

Public examples:

- `examples/clear_color`: minimal clear pass.
- `examples/basic_triangle`: real vertex buffer plus descriptor-first trailing render pass.
- `examples/frame_api_triangle`: explicit `beginRenderPass` / `endPass` usage.
- `examples/ksl_triangle`: KSL-backed triangle using `createShaderFromKsl(...)`.
- `examples/basic_3d_cube`: vertex buffer, index buffer, depth texture, depth-enabled pipeline, and indexed draw.
- `examples/runtime_entry`: callback-state lifecycle smoke test.

Backend interop:

- `examples/raw_sokol_interop`: direct raw Sokol usage only for explicit backend work.

## Validation

Useful commands:

```powershell
kira check --backend hybrid examples\api_preflight_fake
kira check examples\api_preflight_fake
kira check .
kira check --backend hybrid examples\clear_color
kira check --backend hybrid examples\basic_triangle
kira check --backend hybrid examples\frame_api_triangle
kira check --backend hybrid examples\ksl_triangle
kira check --backend hybrid examples\runtime_entry
kira check --backend hybrid examples\raw_sokol_interop
kira check --backend hybrid examples\basic_3d_cube
kira build --backend hybrid examples\basic_triangle
kira build --backend hybrid examples\basic_3d_cube
kira run --backend hybrid examples\runtime_entry
powershell -ExecutionPolicy Bypass -File tests\run_ksl_integration.ps1
```
