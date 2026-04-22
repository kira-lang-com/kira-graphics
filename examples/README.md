# Kira Graphics Examples

## Public API

- `basic_triangle`: public Kira Graphics triangle using generated GLSL paths.
- `clear_color`: minimal frame and clear pass.
- `runtime_entry`: lifecycle and callback-state smoke test.
- `ksl_triangle`: public Kira Graphics triangle using the existing KSL-generated GLSL directory.
- `frame_api_triangle`: explicit begin/end frame API triangle using inline shader source.

## Backend Interop

- `raw_sokol_interop`: direct Sokol binding example for backend/native interop work.

Public API examples should import `KiraGraphics` only. Backend interop examples may import `KiraGraphics.sokol`.
