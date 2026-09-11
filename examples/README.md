# Kira Graphics Examples

## Public API

- `basic_triangle`: public Kira Graphics triangle using generated GLSL paths.
- `basic_3d_cube`: real vertex/index/depth example with a descriptor-first render pass.
- `clear_color`: minimal frame and clear pass.
- `runtime_entry`: lifecycle and callback-state smoke test.
- `ksl_triangle`: public Kira Graphics triangle using the existing KSL-generated GLSL directory.
- `vulkan_triangle`: the same descriptor-first triangle through Vulkan and inline SPIR-V.
- `frame_api_triangle`: explicit `beginRenderPass` / `endPass` triangle using inline shader source.
- `ui_demo`: centered rectangle with two small rectangles standing in for text.
- `liquid_glass`: dependency-free KSL liquid-glass render with offscreen blur passes. Run `run_backend.sh metal|dawn|vulkan` or the PowerShell equivalent.

## Backend Interop

Public API examples should import `KiraGraphics` only.
