# Kira Graphics

Kira Graphics is now structured as a real Kira library package with a small public graphics API over a Sokol backend. Normal users import `KiraGraphics`, configure a `GraphicsApplication`, register lifecycle callbacks with trailing blocks such as `app.onFrame { frame in ... }`, create long-lived resources during init, encode work through `GraphicsFrame` and `RenderEncoder`, and keep app state in opaque callback storage with `nativeState`, `nativeUserData`, and `nativeRecover<T>`.

The raw Sokol binding still exists for backend and interop work, but it is not the public API.

## Source Layout

```text
app/
  kiragraphics.kira
  sokol.kira                  # generated raw Sokol binding for backend/interop use
  Public/
    Buffer.kira
    Color.kira
    Frame.kira
    Graphics.kira
    Pipeline.kira
    RenderEncoder.kira
    Shader.kira
    Types.kira
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
  Shader/
    ShaderDescriptor.kira
    ShaderSource.kira
  Resources/
    BufferDescriptor.kira
    PipelineDescriptor.kira
  App/
    AppConfig.kira
    NativeStateBridge.kira
```

`Public/` is the user-facing facade. `Core/` owns runtime flow and validation. `Backend/` owns the backend abstraction and Sokol implementation. `Shader/` and `Resources/` hold the descriptors used by the current vertical slice. `App/` owns app callback/runtime state bridging.

## Public API Slice

The current vertical slice supports:

- window configuration with `GraphicsApplication`
- init/frame/cleanup lifecycle registration with trailing callbacks on `GraphicsApplication`
- persistent callback state through `nativeState`, `nativeUserData`, and `nativeRecover<T>`
- shader and render-pipeline creation
- clear passes through `GraphicsFrame`
- command encoding through `RenderEncoder`
- triangle drawing through the Sokol backend path
- explicit cleanup for shaders, pipelines, and backend-owned default triangle resources

Public examples should import only `KiraGraphics`. Direct Sokol imports belong only in raw backend interop examples.

## Examples

Public Kira Graphics API examples:

- `examples/clear_color`: minimal clear pass and app lifecycle.
- `examples/basic_triangle`: public API triangle using generated GLSL paths.
- `examples/frame_api_triangle`: explicit begin/end frame API triangle.
- `examples/ksl_triangle`: public API triangle using existing KSL-generated GLSL output.
- `examples/runtime_entry`: lifecycle and callback-state smoke test.

Raw backend interop example:

- `examples/raw_sokol_interop`: direct Sokol binding usage for backend proof-of-interop work.

The old `rotating_cube` placeholder was removed because it rendered a triangle under a stale cube name.

## Temporary KSL Path Handling

KSL asset discovery is intentionally not designed in this pass. The triangle examples use explicit generated GLSL paths such as:

- `generated/Shaders/BasicTriangle.vert.glsl` from `examples/basic_triangle`
- `generated/Shaders/BasicTriangle.frag.glsl` from `examples/basic_triangle`
- `generated/shaders/BasicTriangle.vert.glsl` from `examples/ksl_triangle`
- `generated/shaders/BasicTriangle.frag.glsl` from `examples/ksl_triangle`

A later compiler/build metadata pass should replace these hardcoded paths.

## Validation

Useful commands:

```powershell
kira check .
kira check --backend hybrid examples\clear_color
kira check --backend hybrid examples\basic_triangle
kira check --backend hybrid examples\frame_api_triangle
kira check --backend hybrid examples\ksl_triangle
kira check --backend hybrid examples\raw_sokol_interop
kira build --backend hybrid examples\basic_triangle
kira run --backend hybrid examples\runtime_entry
powershell -ExecutionPolicy Bypass -File tests\run_ksl_integration.ps1
```
