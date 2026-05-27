#include <stdint.h>
#include <stdio.h>

#if defined(__EMSCRIPTEN__)
#include <emscripten.h>
#endif

#include "sokol_app.h"
#include "sokol_gfx.h"

void kg_setup(void);
uint32_t kg_make_shader(const char* label, const char* vertex_source, const char* fragment_source, const char* vertex_path, const char* fragment_path);
uint32_t kg_make_ksl_shader(const char* label, const char* asset, const char* directory);
uint32_t kg_make_pipeline_detailed(
    uint32_t shader_id,
    const char* label,
    int64_t vertex_stride,
    int64_t attribute_count,
    int64_t attr0_location,
    int64_t attr0_format,
    int64_t attr0_offset,
    int64_t attr1_location,
    int64_t attr1_format,
    int64_t attr1_offset,
    int64_t attr2_location,
    int64_t attr2_format,
    int64_t attr2_offset,
    int64_t attr3_location,
    int64_t attr3_format,
    int64_t attr3_offset,
    int64_t color_target_count,
    int64_t color_format,
    int64_t blend_enabled,
    int64_t blend_preset,
    int64_t depth_enabled,
    int64_t depth_write_enabled,
    int64_t depth_compare,
    int64_t depth_format,
    int64_t cull_mode,
    int64_t front_face,
    int64_t topology
);
uint32_t kg_begin_render_pass(
    const char* label,
    int64_t color_target_kind,
    uint32_t color_texture_id,
    int64_t color_mip_level,
    int64_t color_array_layer,
    int64_t color_load_action,
    int64_t color_store_action,
    double clear_r,
    double clear_g,
    double clear_b,
    double clear_a,
    int64_t has_resolve_target,
    uint32_t resolve_texture_id,
    int64_t resolve_mip_level,
    int64_t resolve_array_layer,
    int64_t has_depth_attachment,
    uint32_t depth_texture_id,
    int64_t depth_load_action,
    int64_t depth_store_action,
    double clear_depth,
    int64_t depth_read_only,
    int64_t has_stencil_attachment,
    uint32_t stencil_texture_id,
    int64_t stencil_load_action,
    int64_t stencil_store_action,
    int64_t clear_stencil,
    int64_t stencil_read_only
);
uint32_t kg_apply_pipeline_bindings_and_draw(
    uint32_t pipeline_id,
    uint32_t vertex_buffer_id,
    int64_t has_vertex_buffer,
    uint32_t index_buffer_id,
    int64_t has_index_buffer,
    uint32_t bind_group0_id,
    int64_t has_bind_group0,
    uint32_t bind_group1_id,
    int64_t has_bind_group1,
    uint32_t bind_group2_id,
    int64_t has_bind_group2,
    uint32_t bind_group3_id,
    int64_t has_bind_group3,
    int64_t vertex_count,
    int64_t index_count,
    int64_t instance_count
);
void kg_end_pass_and_commit(void);
void kg_destroy_pipeline_id(uint32_t pipeline_id);
void kg_destroy_shader_id(uint32_t shader_id);
void kg_destroy_default_resources(void);
void kg_report_lifetime(void);

static uint32_t smoke_shader_id = 0;
static uint32_t smoke_pipeline_id = 0;
static uint32_t smoke_ksl_shader_id = 0;
static uint32_t smoke_ksl_pipeline_id = 0;
static int smoke_frame_count = 0;
static int smoke_failed = 0;

static void smoke_note(const char* key, const char* value) {
    printf("KIRA_GRAPHICS_WEBGPU_%s=%s\n", key, value);
#if defined(__EMSCRIPTEN__)
    EM_ASM({
        globalThis.KiraGraphicsWebGPUSmoke = globalThis.KiraGraphicsWebGPUSmoke || {};
        globalThis.KiraGraphicsWebGPUSmoke[UTF8ToString($0)] = UTF8ToString($1);
    }, key, value);
#endif
}

void kira_live_emit_first_frame(void) {
    smoke_note("FIRST_FRAME", "true");
}

void kira_live_emit_log_line(const char* line) {
    printf("%s\n", line ? line : "");
}

static const char* smoke_vertex_wgsl =
    "@vertex\n"
    "fn main(@builtin(vertex_index) vertex_index: u32) -> @builtin(position) vec4f {\n"
    "    var positions = array<vec2f, 3>(\n"
    "        vec2f(0.0, 0.65),\n"
    "        vec2f(-0.65, -0.65),\n"
    "        vec2f(0.65, -0.65)\n"
    "    );\n"
    "    return vec4f(positions[vertex_index], 0.0, 1.0);\n"
    "}\n";

static const char* smoke_fragment_wgsl =
    "@fragment\n"
    "fn main() -> @location(0) vec4f {\n"
    "    return vec4f(0.12, 0.62, 0.95, 1.0);\n"
    "}\n";

static void smoke_fail(const char* reason) {
    smoke_failed = 1;
    smoke_note("FAILURE", reason);
    sapp_request_quit();
}

static void smoke_init(void) {
    kg_setup();
    if (!sg_isvalid()) {
        smoke_fail("sg_setup_invalid");
        return;
    }
    smoke_note("DEVICE_CONTEXT", "acquired");
    if (sg_query_backend() == SG_BACKEND_WGPU) {
        smoke_note("BACKEND", "wgpu");
    } else {
        smoke_fail("backend_not_wgpu");
        return;
    }

    smoke_shader_id = kg_make_shader("webgpu-smoke-wgsl", smoke_vertex_wgsl, smoke_fragment_wgsl, "", "");
    if (smoke_shader_id == 0) {
        smoke_fail("shader_creation_failed");
        return;
    }
    smoke_note("WGSL_SHADER", "created");

    smoke_pipeline_id = kg_make_pipeline_detailed(
        smoke_shader_id,
        "webgpu-smoke-pipeline",
        0,
        0,
        0,
        1,
        0,
        1,
        1,
        0,
        2,
        1,
        0,
        3,
        1,
        0,
        1,
        1,
        0,
        1,
        0,
        0,
        6,
        3,
        0,
        2,
        1
    );
    if (smoke_pipeline_id == 0) {
        smoke_fail("pipeline_creation_failed");
        return;
    }
    smoke_note("PIPELINE", "created");

    smoke_ksl_shader_id = kg_make_ksl_shader("webgpu-smoke-ksl-wgsl", "BasicTriangle", "generated/shaders");
    if (smoke_ksl_shader_id == 0) {
        smoke_fail("ksl_shader_creation_failed");
        return;
    }
    smoke_note("KSL_WGSL_SHADER", "created");

    smoke_ksl_pipeline_id = kg_make_pipeline_detailed(
        smoke_ksl_shader_id,
        "webgpu-smoke-ksl-pipeline",
        8,
        1,
        0,
        1,
        0,
        1,
        1,
        0,
        2,
        1,
        0,
        3,
        1,
        0,
        1,
        1,
        0,
        1,
        0,
        0,
        6,
        3,
        0,
        2,
        1
    );
    if (smoke_ksl_pipeline_id == 0) {
        smoke_fail("ksl_pipeline_creation_failed");
        return;
    }
    smoke_note("KSL_PIPELINE", "created");
}

static void smoke_frame(void) {
    if (smoke_failed) {
        return;
    }
    smoke_frame_count += 1;
    if (kg_begin_render_pass("webgpu-smoke-render-pass", 1, 0, 0, 0, 1, 1, 0.04, 0.06, 0.10, 1.0, 0, 0, 0, 0, 0, 0, 1, 1, 1.0, 0, 0, 0, 1, 1, 0, 0) == 0) {
        smoke_fail("render_pass_begin_failed");
        return;
    }
    smoke_note("RENDER_PASS", "begun");
    if (kg_apply_pipeline_bindings_and_draw(smoke_pipeline_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1) == 0) {
        smoke_fail("draw_failed");
        return;
    }
    smoke_note("DRAW", "submitted");
    kg_end_pass_and_commit();
    smoke_note("FRAME", "rendered");
#if defined(__EMSCRIPTEN__)
    EM_ASM({
        globalThis.KiraGraphicsWebGPUSmoke = globalThis.KiraGraphicsWebGPUSmoke || {};
        globalThis.KiraGraphicsWebGPUSmoke.done = true;
    });
#endif
    if (smoke_frame_count >= 1) {
        sapp_request_quit();
    }
}

static void smoke_cleanup(void) {
    if (smoke_ksl_pipeline_id != 0) {
        kg_destroy_pipeline_id(smoke_ksl_pipeline_id);
        smoke_ksl_pipeline_id = 0;
    }
    if (smoke_ksl_shader_id != 0) {
        kg_destroy_shader_id(smoke_ksl_shader_id);
        smoke_ksl_shader_id = 0;
    }
    if (smoke_pipeline_id != 0) {
        kg_destroy_pipeline_id(smoke_pipeline_id);
        smoke_pipeline_id = 0;
    }
    if (smoke_shader_id != 0) {
        kg_destroy_shader_id(smoke_shader_id);
        smoke_shader_id = 0;
    }
    kg_destroy_default_resources();
    kg_report_lifetime();
    sg_shutdown();
    smoke_note("CLEANUP", "complete");
}

sapp_desc sokol_main(int argc, char* argv[]) {
    (void)argc;
    (void)argv;
    sapp_desc desc = {0};
    desc.init_cb = smoke_init;
    desc.frame_cb = smoke_frame;
    desc.cleanup_cb = smoke_cleanup;
    desc.width = 640;
    desc.height = 360;
    desc.sample_count = 1;
    desc.window_title = "Kira Graphics WebGPU Smoke";
    desc.html5.canvas_selector = "#canvas";
    desc.html5.canvas_resize = true;
    return desc;
}
