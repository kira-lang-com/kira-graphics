# Kira Graphics

Kira Graphics is shaped around an application lifecycle and frame-scoped rendering API. Public examples should model an app that owns persistent state, initializes resources during launch, updates simulation state during ticks, and records render work through a frame object.

The current backend path is still Sokol GFX through a native bridge, but that bridge should be treated as backend interop, not as the engine architecture. Kira-side code owns the lifecycle shape and resource ownership model.

## Lifecycle

An app has three public phases:

- `onLaunch`: one-time setup for persistent resources such as pipelines, buffers, textures, samplers, and app state.
- `onUpdate`: per-tick simulation and input work. It exists even when a minimal sample has no animation yet.
- `onFrame`: per-frame rendering. Render passes and encoders are scoped to the frame API.

The current compiler now checks direct trailing callbacks and function types, so public samples can use the intended lifecycle spelling directly. The current callback implementation is intentionally non-capturing, so examples lean on top-level helper functions and explicit data construction rather than captured locals.

```kira
import KiraGraphics

struct TriangleDemo {
    var pipeline: RenderPipeline
    var vertexBuffer: GraphicsBuffer
}

@Main
function main() {
    let app = Application {
        title: "Kira Graphics KSL Triangle"
        windowWidth: 640
        windowHeight: 480
    }

    app.onLaunch {
        initializeTriangle()
    }

    app.onUpdate { deltaTime in
        updateTriangle(deltaTime)
    }

    app.onFrame { frame in
        renderTriangle(frame)
    }

    app.run()
}
```

## Frame API

Render encoders are frame-scoped. User code should not construct a command buffer in `main()` or manually stitch presentation together.

Use this shape:

```kira
app.onFrame { frame in
    frame.pass(clearColor) { renderEncoder in
        encodeTriangle(renderEncoder)
    }
}
```

Avoid the old transitional shape:

```kira
let commandBuffer: GraphicsCommandBuffer = GraphicsCommandBuffer()
var renderEncoder: RenderEncoder = RenderEncoder()
applicationPresentFrame(app, commandBuffer.commitRenderCommands(renderPass, renderEncoder))
```

## Examples

Build the KSL triangle sample:

```powershell
kira build examples/ksl_triangle
```

Check the frame API sample:

```powershell
kira check examples/frame_api_triangle
```

Run integration and lifecycle-shape checks:

```powershell
powershell -ExecutionPolicy Bypass -File tests/run_ksl_integration.ps1
```

## Architecture Note

Moved out of the public architecture:

- the one-shot `main()` render pass pattern
- top-level user-owned command buffers for the triangle sample
- manual `applicationPresentFrame(...)` calls in public examples
- `type` declarations in public Kira Graphics code
- the compatibility `Scene.encodeFrame` path using `GraphicsCommandBuffer`
- the KSL inspection/report entrypoint from the backend runtime body; it now lives in `NativeLibs/Sokol/kira_graphics_asset_inspection.inc`

Still native-only today:

- Sokol App setup, frame callbacks, swapchain access, cleanup, and GFX submit
- native shader, pipeline, buffer creation, and draw submission
- KSL asset file IO, generated GLSL loading, reflection JSON parsing, GLSL compatibility fixups, and vertex layout validation

The remaining native KSL asset/reflection work is isolated as transitional backend compatibility. It should move behind generated Kira asset metadata or a smaller asset-loading module once Kira has the needed file/path/reflection facilities. The C bridge should continue shrinking toward a thin native backend that accepts already-described frame/resource work from Kira.

## Current Limits

- Trailing callbacks are currently non-capturing. Public samples use top-level helper functions instead of captured local state.
- Builder/tree lowering is preserved semantically for construct-driven DSLs, but Kira Graphics itself is using ordinary callback-style lifecycle APIs rather than builder DSLs.
- Interactive render verification still requires running the produced executable in a windowed environment.
- Compute, copy, bind group application, and offscreen targets are represented in the public model but are not fully executed by the current GLSL 330 Sokol path.
