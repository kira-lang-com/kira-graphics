# Architecture

Kira Graphics is organized around one public package and one backend implementation.

Public users should import `KiraGraphics` and stay in the facade types:

- `GraphicsApplication`
- `GraphicsAppCallbacks`
- `Graphics`
- `GraphicsFrame`
- `RenderEncoder`
- `GraphicsShader`
- `RenderPipeline`
- `GraphicsBuffer`
- descriptor types in `Shader/` and `Resources/`

The public layer delegates runtime work to `Core/`. Core code owns app runtime state, frame submission, validation, diagnostics, and resource bookkeeping types. Core code does not expose Sokol handles as the user model.

The backend layer is split into:

- `Backend/BackendTypes.kira` for opaque backend handles
- `Backend/Backend.kira` for backend identity
- `Backend/Sokol/` for Sokol-specific app setup, frame submission, shader/pipeline creation, and native helper declarations

Raw `sg_*` and `sapp_*` calls are allowed inside the Sokol backend and the explicit `raw_sokol_interop` example. Public examples should not use raw Sokol.

`app/sokol.kira` is the generated low-level binding. It remains in the package so the Sokol backend and raw interop example can compile, but it is deliberately not the style public examples teach.

KSL-generated GLSL paths are hardcoded for now. That is intentionally temporary; final asset discovery and richer shader reflection should come from compiler/build metadata later.
