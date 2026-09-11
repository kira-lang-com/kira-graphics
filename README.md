<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/KiraGraphicsBannerDark.png">
  <source media="(prefers-color-scheme: light)" srcset="Images/KiraGraphicsBannerLight.png">
  <img alt="Kira Graphics" src="Images/KiraGraphicsBannerLight.png">
</picture>

# Kira Graphics

Kira Graphics is a general-purpose graphics foundation for Kira, not a UI-only renderer. The public API is aimed at real 3D rendering, engine-style frame encoding, post-processing foundations, and future UI/effects layers that sit on top of the same explicit graphics model.

Public applications import `KiraGraphics`, configure a `GraphicsApplication`, attach lifecycle callbacks with trailing blocks, store app state with `nativeState` / `nativeUserData` / `nativeRecover<T>`, create real buffers and pipelines during init, and encode work through descriptor-first render passes and `RenderEncoder`.

The native backends are Metal on Apple and Vulkan on Windows/Linux; Dawn remains
available for WebGPU and compatibility runs.

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

## Typed Descriptor Values

Descriptors use typed enums for usage, formats, topology, blending, depth, and
window mode. Backend wire numbers stay inside the backend vocabulary and never
leak into application code.

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
    Dawn/
      DawnApplication.kira
      DawnContext.kira
      DawnResources.kira
      DawnPipeline.kira
    Vulkan/
      VulkanApplication.kira
      VulkanContext.kira
      VulkanResources.kira
      VulkanPipeline.kira
      VulkanPass.kira
      VulkanDraw.kira
    Metal/
      MetalForeign.kira       (the entire objc-runtime + Metal FFI surface; no shim)
      MetalContext.kira        (device/queue/surface/registry/depth)
      MetalResources.kira      (shaders, pipelines, vertex/index buffers, uniforms, draws)
      MetalTexture.kira        (textures + samplers)
      MetalBindGroup.kira      (bind-group apply)
      MetalFrame.kira          (begin/end/submit bridge)
      MetalSelfTest.kira       (offscreen render + pixel-readback verdicts)
      MetalApplication.kira    (lifecycle)
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

`Public/` is the user-facing facade. `Core/` owns runtime flow, validation, and diagnostics. `Backend/` owns the backend abstraction and the Metal, Dawn, and Vulkan implementations. `Resources/` and `Shader/` hold the descriptor-first surface. `App/` owns lifecycle registration and callback-state bridging.

## Examples

Public examples:

- `examples/clear_color`: minimal clear pass.
- `examples/basic_triangle`: real vertex buffer plus descriptor-first trailing render pass.
- `examples/frame_api_triangle`: explicit `beginRenderPass` / `endPass` usage.
- `examples/ksl_triangle`: KSL-backed triangle using `createShaderFromKsl(...)`.
- `examples/vulkan_triangle`: Vulkan triangle using inline SPIR-V from `ksl!`.
- `examples/basic_3d_cube`: vertex buffer, index buffer, depth texture, depth-enabled pipeline, and indexed draw.
- `examples/runtime_entry`: callback-state lifecycle smoke test.
- `examples/liquid_glass`: KSL liquid-glass render with sampled image and offscreen blur passes. Run `run_backend.sh metal|dawn|vulkan` or the PowerShell equivalent.

Backend verification:

- `tests/metal_kik`: Apple offscreen pixel tests.
- `tests/vulkan_kik`: Linux/Windows Vulkan clear-and-readback test.

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
  kira check --backend hybrid examples\vulkan_triangle
kira check --backend hybrid examples\basic_3d_cube
kira build --backend hybrid examples\basic_triangle
kira build --backend hybrid examples\basic_3d_cube
kira run --backend hybrid examples\runtime_entry
powershell -ExecutionPolicy Bypass -File tests\run_ksl_integration.ps1
```
