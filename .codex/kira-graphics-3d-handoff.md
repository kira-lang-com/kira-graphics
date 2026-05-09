# Kira Graphics 3D Handoff

## User Goal
Implement the smallest real 3D graphics API slice needed for `examples/basic_3d_cube` to render through app-owned camera/model/view/projection matrices, uniform parameter passing, depth, and simple directional lighting. Remove fake clip-space projection constants from the cube shader.

## Current State
Start state was clean: `git status --short` produced no output. Swapchain/default depth support and indexed cube draw were already present per user context and current files. Current cube shader now uses real scene/object uniforms, model/viewProjection matrix multiply, normal transform, simple directional lighting, and swapchain depth. Current branch/ref unknown at this checkpoint. Final dirty files are listed under Files Changed; `.codex/` is untracked by design for this handoff.

## Key Decisions
- Fake shader projection is rejected because the app/API must own camera, model, view, projection, and light state, and the shader should only consume GPU parameters.
- Swapchain color passes should use `swapchainDepthAttachment()` with no explicit depth texture; offscreen color passes require explicit depth textures; mixed swapchain color plus explicit depth should keep failing early.
- Use existing `RenderEncoderState.bindGroup0Id..bindGroup3Id` fields instead of creating an unrelated encoder path.
- Vendored Sokol uses old-style `sg_apply_uniforms(int ub_slot, const sg_range* data)`, so the minimal real path is CPU-owned uniform payloads applied to Sokol uniform block slots immediately before draw.
- KSL supports `group { uniform name: Type }`, `Float4x4`, `mul(matrix, vector)`, `dot`, and `normalize`; KSL v1 intentionally uses `mul` instead of matrix `*`.
- KSL GLSL currently emits `layout(std140) uniform ...` blocks, but this Sokol GL path's `sg_apply_uniforms` resolves classic uniform locations. The native bridge now narrowly rewrites the cube's generated GLSL blocks to `uniform SceneUniforms scene;` / `uniform ObjectUniforms object;` at shader-load time so `scene.viewProjection` and `object.model` locations resolve and the uniform data is actually applied.

## Files Inspected
- `NativeLibs/Sokol/sokol_impl.c`: Sokol setup, shader creation, pipeline creation, render pass/depth handling, draw path; no real uniform application yet.
- `NativeLibs/Sokol/sokol_gfx.h`: confirms `sg_apply_uniforms`, `sg_shader_uniform_block`, `SG_UNIFORMLAYOUT_STD140`, `SG_UNIFORMTYPE_MAT4`, `SG_UNIFORMTYPE_FLOAT4`.
- `app/Public/RenderEncoder.kira`: bind group fields and `setBindGroup` exist but are not forwarded to native draw.
- `app/Public/Graphics.kira`: buffer/texture/shader/pipeline creation exists; no uniform/bind-group creation.
- `app/Public/Constants.kira`: `bufferUsageUniform()` already exists; constants are Int-returning functions.
- `app/Public/Buffer.kira`: simple `GraphicsBuffer` handle.
- `app/Public/Texture.kira`: simple `GraphicsTexture` handle.
- `app/Public/BindGroup.kira`: empty handle only.
- `app/Public/Uniform.kira`: empty handle only.
- `app/Resources/RenderPassDescriptor.kira`: `swapchainDepthAttachment()` exists.
- `app/Resources/PipelineDescriptor.kira`: actual pipeline descriptor file; requested `RenderPipelineDescriptor.kira` path does not exist.
- `app/Resources/BufferDescriptor.kira`: float and index buffer descriptors.
- `app/Resources/TextureDescriptor.kira`: texture descriptor.
- `app/Backend/Sokol/SokolBackend.kira`: FFI declarations for Sokol C bridge; draw signature lacks bind groups.
- `app/Backend/Sokol/SokolFrame.kira`: submit path and render pass begin/end logic; draw signature lacks bind groups.
- `app/Backend/Sokol/SokolPipeline.kira`: pipeline descriptor lowering.
- `app/Backend/Sokol/SokolBuffer.kira`: buffer upload wrappers.
- `app/Public/Frame.kira`: render pass lifecycle and encoder end path.
- `examples/basic_3d_cube/app/main.kira`: cube has 24 vertices, 36 indices, depth pass, but no camera/uniforms.
- `examples/basic_3d_cube/Shaders/BasicCube.ksl`: still has hardcoded fake projection constants.
- `examples/basic_3d_cube/generated/shaders/BasicCube.vert.glsl`: generated fake projection constants present.
- `examples/basic_3d_cube/generated/shaders/BasicCube.frag.glsl`: simple color pass.
- `../kirac/docs/ksl.md` and `../kirac/examples/shaders/lit_surface.ksl`: canonical KSL uniform/matrix/light syntax.

## Files Changed
- `.codex/kira-graphics-3d-handoff.md`: created this continuation file.
- `NativeLibs/Sokol/sokol_impl.c`: added math wrappers, uniform and bind-group registries, BasicCube uniform block shader descriptors, draw-time `sg_apply_uniforms`, and missing-uniform diagnostics.
- `app/Backend/Sokol/SokolBackend.kira`: added FFI declarations for uniforms, bind groups, math wrappers, and the extended draw signature.
- `app/Backend/Sokol/SokolFrame.kira`: updated the backend draw wrapper signature.
- `app/Public/RenderEncoder.kira`: forwards existing bind-group slots to native draw calls.
- `app/Resources/UniformDescriptor.kira`: added uniform and bind-group descriptor structs.
- `app/Public/Graphics.kira`: added uniform and bind-group creation/update/destruction methods.
- `app/Public/Constants.kira`: added `uniformSlotScene()` and `uniformSlotObject()`.
- `app/Public/Math3D.kira`: added `Float3`, `Float4`, `Float4x4`, vector helpers, matrix transforms, perspective, and lookAt.
- `app/Public/Camera3D.kira`: added `PerspectiveCamera` and view/projection/viewProjection helpers.
- `app/Public/Light3D.kira`: added `DirectionalLight`, `SceneUniforms`, `ObjectUniforms`, and std140 float serializers.
- `app/Public/Uniform.kira`: added `updateGraphicsUniform(uniform, data)` free function for per-frame uniform uploads without needing a `Graphics` handle.
- `examples/basic_3d_cube/app/main.kira`: added scene/object uniforms, bind groups, app-side camera/light/model setup, uniform updates, and encoder bind calls.
- `examples/basic_3d_cube/Shaders/BasicCube.ksl`: replaced fake projection constants with KSL uniform groups, model/viewProjection matrix multiply, normal transform, and simple directional lighting.
- `examples/basic_3d_cube/generated/shaders/BasicCube.vert.glsl`: regenerated by `kira shader build`; contains uniform blocks and matrix multiply, no fake projection constants.
- `examples/basic_3d_cube/generated/shaders/BasicCube.frag.glsl`: regenerated by `kira shader build`; contains lighting from scene uniform data.
- `examples/basic_3d_cube/generated/shaders/BasicCube.reflection.json`: regenerated; reports `SceneUniforms` size 96 and `ObjectUniforms` size 80. These generated files are not shown in `git status`, likely ignored.
- `generated/native/x86_64-windows-msvc/sokol.lib`: regenerated locally from edited `NativeLibs/Sokol/sokol_impl.c`; ignored by git but required for local runtime validation.

## API Shape Implemented
- `struct Float3`, `struct Float4`, `struct Float4x4`
- `function matrixIdentity4x4() -> Float4x4`
- `function matrixTranslation(position: Float3) -> Float4x4`
- `function matrixScale(scale: Float3) -> Float4x4`
- `function matrixRotationX(radians: Float) -> Float4x4`
- `function matrixRotationY(radians: Float) -> Float4x4`
- `function matrixRotationZ(radians: Float) -> Float4x4`
- `function matrixMultiply(a: Float4x4, b: Float4x4) -> Float4x4`
- `function matrixPerspectiveRightHanded(fovYRadians: Float, aspect: Float, nearPlane: Float, farPlane: Float) -> Float4x4`
- `function matrixLookAtRightHanded(eye: Float3, target: Float3, up: Float3) -> Float4x4`
- `struct PerspectiveCamera`
- `function cameraViewMatrix(camera: PerspectiveCamera) -> Float4x4`
- `function cameraProjectionMatrix(camera: PerspectiveCamera) -> Float4x4`
- `function cameraViewProjectionMatrix(camera: PerspectiveCamera) -> Float4x4`
- `struct DirectionalLight`
- `struct SceneUniforms`, `struct ObjectUniforms`
- `function sceneUniformData(uniforms: SceneUniforms) -> [Float]` returns 24 floats / 96 bytes.
- `function objectUniformData(uniforms: ObjectUniforms) -> [Float]` returns 20 floats / 80 bytes.
- `struct UniformDescriptor { label, expectedFloatCount, data }`
- `struct UniformBindEntry { uniformSlot, uniform }`
- `struct BindGroupDescriptor { label, uniformEntries }`
- `Graphics.createUniform`, `Graphics.updateUniform`, `Graphics.destroyUniform`, `Graphics.createBindGroup`, `Graphics.destroyBindGroup`
- `Graphics.createUniformBindGroup(label: String, uniformSlot: Int, uniform: GraphicsUniform) -> BindGroup` was added after runtime hit a hybrid nested-struct-copy bug in array-backed `BindGroupDescriptor`.
- `uniformSlotScene() -> Int` returns 0 and `uniformSlotObject() -> Int` returns 1.

## Native/Sokol Implementation Notes
Use `sg_shader_desc.uniform_blocks[N]` with `SG_UNIFORMLAYOUT_STD140` and member names matching generated GLSL uniform block instance fields such as `scene.viewProjection`. Use `sg_apply_uniforms(slot, &range)` after `sg_apply_pipeline`/`sg_apply_bindings` and before `sg_draw`. The repo is currently `#define SOKOL_GLCORE`, so the GL backend resolves flattened uniform names via `glGetUniformLocation`.
Current native shader desc support is deliberately minimal and recognizes `scene_Block` at slot 0 with size 96 bytes and `object_Block` at slot 1 with size 80 bytes. This is enough for the cube's first real 3D path but is not a reflection-driven general uniform system yet.
Because Sokol GL `sg_apply_uniforms` uses `glUniform*` calls rather than UBO uploads, `kg_prepare_shader_source_for_sokol` transforms the exact KSL uniform blocks used by BasicCube into classic uniform struct instances before shader creation. Without this, runtime logs showed Sokol warning that `scene.viewProjection`, `scene.lightDirection`, `scene.lightColor`, `object.model`, and `object.baseColor` were not found.
Manual native rebuild command that worked on Windows: `zig cc -target x86_64-windows-msvc -fno-sanitize=undefined -O2 -c NativeLibs\Sokol\sokol_impl.c -I NativeLibs\Sokol -o generated\native\x86_64-windows-msvc\sokol_impl.obj`; then `zig ar rcs generated\native\x86_64-windows-msvc\sokol.lib generated\native\x86_64-windows-msvc\sokol_impl.obj`. Remove the temporary `.obj` after archiving.

## KSL / Shader Notes
KSL source should use `group Frame { uniform scene: SceneUniforms }` and `group Object { uniform object: ObjectUniforms }`, then `mul(object.model, Float4(...))` and `mul(scene.viewProjection, worldPosition)`. KSL matrix multiply operator `*` is intentionally not used; KSL v1 uses `mul`.
Current BasicCube KSL follows that shape. It uses `scene.lightDirection.w` for light intensity and `scene.lightColor.w` for ambient.

## Validation Commands Run
- `git status --short`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result success, no dirty files.
- Static inspections with `Get-Content` and `rg`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result success except requested `app/Resources/RenderPipelineDescriptor.kira` does not exist; actual file is `app/Resources/PipelineDescriptor.kira`.
- `mcp__kira_docs__.search_docs` for KSL uniform syntax, result did not find useful docs; sibling `../kirac/docs/ksl.md` was used as syntax source.
- `kira shader build Shaders\BasicCube.ksl`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result success but wrote to `Shaders\generated\shaders`, not the app's configured output directory.
- `kira shader build Shaders\BasicCube.ksl --out-dir generated\shaders`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result success; generated GLSL now has `object.model * vec4(...)` and `scene.viewProjection * worldPosition`.
- `kira shader build --help`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result failed with KICE001/FileNotFound because the CLI treated `--help` as a shader path.
- `kira check .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result failed with KSEM093 because `Graphics.createUniform` directly called FFI `kgCreateUniformId`. Fixed by adding `@Native` wrapper helpers in `app/Public/Uniform.kira` and calling those from `Graphics`.
- `kira check .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result failed with KSEM093 because `length3` directly called FFI math. Fixed by adding `graphicsMathSqrt/Sin/Cos/Tan` native wrappers.
- `kira check .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result success: `check passed`.
- `kira build`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result failed with KPROJECT001: repo root has no `app/main.kira`, so it cannot be built as an application entrypoint.
- `kira build .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result failed with unresolved `kg_math_*`, `kg_create_uniform_id`, `kg_set_uniform_float`, `kg_finish_uniform_update`, `kg_destroy_uniform_id`, `kg_create_bind_group_id`, `kg_set_bind_group_uniform`, and `kg_destroy_bind_group_id` because the generated Sokol static lib was stale.
- `zig cc -target x86_64-windows-msvc -c NativeLibs\Sokol\sokol_impl.c ...` then `zig ar rcs ...\sokol.lib ...`, cwd repo root, first manual native rebuild succeeded but produced UBSan runtime references that failed linking.
- `zig cc -target x86_64-windows-msvc -fno-sanitize=undefined -O2 -c NativeLibs\Sokol\sokol_impl.c ...` then `zig ar rcs ...\sokol.lib ...`, cwd repo root, result success with only deprecated C runtime warnings.
- `kira build .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result success; wrote `.kbc`, `.khm`, `.obj`, `.dll`.
- `kira run .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, first attempt failed with KICE001/FileBusy before launch. Killed leftover `kira`/`kirac` processes from the failed run.
- `kira run .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, second attempt reached shader/buffer/uniform creation then failed with hybrid runtime panic `nested struct copy source must be a pointer` while reading `UniformBindEntry` from `BindGroupDescriptor.uniformEntries`. Added `Graphics.createUniformBindGroup(label, slot, uniform)` and switched the cube example to that flatter typed helper.
- `kira check .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics`, result success after flatter bind-group helper.
- `kira build .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result success after flatter bind-group helper.
- `kira run .`, cwd `C:\Users\Shadow\Coding\kira-projects\kira-graphics\examples\basic_3d_cube`, result success. Logs show shader creation, 36 cube indices, swapchain depth `depth=1 depthTex=0`, `KG DRAW ... idx=36`, and uniform application `slot=0 bytes=96` plus `slot=1 bytes=80`. No Sokol validation panic occurred.
- Final static check: `rg -n "frontX|rightX|topX|clipX|clipY|nearPlane|farPlane" examples/basic_3d_cube/Shaders/BasicCube.ksl examples/basic_3d_cube/generated/shaders/BasicCube.vert.glsl examples/basic_3d_cube/generated/shaders/BasicCube.frag.glsl`, result no matches.
- After seeing Sokol `GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER` warnings for the KSL uniform-block output, added the narrow native GLSL source transform and reran the native rebuild, `kira build .`, and `kira run .`. Final run logs show no Sokol uniform-name warnings in the first 80 stdout lines; repeated draw logs still show `idx=36`, swapchain depth, and uniform apply slots 0/1.

## Known Problems
- Visual output was validated by runtime logs, not by captured screenshot. Remaining visual limitation: normal transform uses the model matrix with `w=0`, which is fine for current rotation/scale but is not a full inverse-transpose normal matrix.
- `BindGroupDescriptor` with `[UniformBindEntry]` exists but triggered a hybrid nested-struct-copy runtime bug in this example. The cube uses `createUniformBindGroup(label, slot, uniform)` as the safe flat helper.
- Native shader uniform setup and GLSL block rewriting are hardcoded for `scene_Block` and `object_Block`; future work should consume KSL reflection instead.
- No runtime validation has been run yet.

## Next Steps
1. Replace hardcoded native `scene_Block`/`object_Block` shader desc setup with reflection-driven uniform block configuration.
2. Decide whether to keep `BindGroupDescriptor` arrays blocked until the hybrid nested-struct-copy bug is fixed, or remove the descriptor overload temporarily.
3. Add inverse-transpose normal matrix support when non-uniform scale becomes a target.
4. Consider reducing per-frame diagnostic logging once this slice is stable.
5. Capture a screenshot or add an automated visual smoke check if visual proof is needed beyond runtime logs.

## Do Not Repeat These Mistakes
- fake projection constants in KSL
- explicit depth texture with swapchain color
- assuming idx is not 36
- tuning shader constants instead of adding camera/uniform API
- bypassing existing `RenderEncoder` bind-group fields
