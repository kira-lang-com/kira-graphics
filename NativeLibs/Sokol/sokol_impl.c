#define SOKOL_IMPL
#define SOKOL_NO_ENTRY
#define SOKOL_GLCORE
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#if defined(_WIN32)
#include <windows.h>
#elif defined(__APPLE__)
#include <mach-o/dyld.h>
#elif defined(__linux__)
#include <unistd.h>
#endif

#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"

static sg_buffer kg_triangle_vertex_buffer = {0};
static sg_buffer kg_ui_demo_vertex_buffer = {0};
static uint32_t kg_ui_demo_pipeline_id = 0;
#ifndef KG_PATH_BUFFER_SIZE
#define KG_PATH_BUFFER_SIZE 4096
#endif

typedef struct {
    uint32_t id;
    bool has_position_attribute;
    bool has_normal_attribute;
    uint32_t required_uniform_mask;
    uint32_t available_uniform_mask;
} kg_shader_record;

typedef struct {
    uint32_t public_id;
    uint32_t draw_pipeline_id;
    uint32_t indexed_pipeline_id;
    bool has_position_attribute;
    uint32_t required_uniform_mask;
    uint32_t available_uniform_mask;
} kg_pipeline_record;

typedef struct {
    bool active;
    bool is_index_buffer;
    int64_t usage;
    int64_t stride;
    int64_t float_count;
    int64_t int_count;
    float* float_values;
    uint32_t* int_values;
    char* label;
} kg_buffer_upload_record;

typedef struct {
    uint32_t image_id;
    uint32_t color_view_id;
    uint32_t depth_view_id;
    int64_t width;
    int64_t height;
    int64_t sample_count;
    int64_t format;
    int64_t usage;
} kg_texture_record;

typedef struct {
    bool active;
    uint32_t id;
    int64_t expected_float_count;
    int64_t float_count;
    float* values;
    char* label;
} kg_uniform_record;

typedef struct {
    bool active;
    uint32_t id;
    uint32_t uniform_ids[4];
    int uniform_slots[4];
    int uniform_count;
    char* label;
} kg_bind_group_record;

static kg_shader_record kg_shader_records[64];
static int kg_shader_record_count = 0;
static kg_pipeline_record kg_pipeline_records[64];
static int kg_pipeline_record_count = 0;
static uint32_t kg_next_public_pipeline_id = 1;
static kg_buffer_upload_record kg_buffer_upload_records[64];
static kg_texture_record kg_texture_records[64];
static int kg_texture_record_count = 0;
static kg_uniform_record kg_uniform_records[64];
static kg_bind_group_record kg_bind_group_records[64];
static uint32_t kg_next_uniform_id = 1;
static uint32_t kg_next_bind_group_id = 1;
static int kg_current_pass_width = 0;
static int kg_current_pass_height = 0;
static bool kg_current_pass_active = false;
static sg_shader kg_ui_shader = {0};
static sg_pipeline kg_ui_pipeline = {0};
static sg_buffer kg_ui_vertex_buffer = {0};
static int kg_ui_clip_depth = 0;

typedef struct {
    float x;
    float y;
    float w;
    float h;
} kg_ui_clip_rect;

static kg_ui_clip_rect kg_ui_clip_stack[32];

static void kg_sokol_log(const char* tag, uint32_t log_level, uint32_t log_item_id, const char* message, uint32_t line, const char* filename, void* user_data) {
    (void)user_data;
    const char* level = "info";
    if (log_level == 0) {
        level = "panic";
    } else if (log_level == 1) {
        level = "error";
    } else if (log_level == 2) {
        level = "warning";
    }
    printf("Kira Graphics: %s[%u] %s:%u: %s: %s\n",
        tag ? tag : "sokol",
        log_item_id,
        filename ? filename : "sokol_gfx.h",
        line,
        level,
        message ? message : "");
    if (log_level == 0) {
        abort();
    }
}

static void kg_record_shader(uint32_t id, bool has_position_attribute, bool has_normal_attribute, uint32_t required_uniform_mask, uint32_t available_uniform_mask) {
    if (kg_shader_record_count >= 64) {
        return;
    }
    kg_shader_records[kg_shader_record_count].id = id;
    kg_shader_records[kg_shader_record_count].has_position_attribute = has_position_attribute;
    kg_shader_records[kg_shader_record_count].has_normal_attribute = has_normal_attribute;
    kg_shader_records[kg_shader_record_count].required_uniform_mask = required_uniform_mask;
    kg_shader_records[kg_shader_record_count].available_uniform_mask = available_uniform_mask;
    kg_shader_record_count += 1;
}

static bool kg_shader_has_position_attribute(uint32_t id) {
    for (int i = 0; i < kg_shader_record_count; i += 1) {
        if (kg_shader_records[i].id == id) {
            return kg_shader_records[i].has_position_attribute;
        }
    }
    return false;
}

static bool kg_shader_has_normal_attribute(uint32_t id) {
    for (int i = 0; i < kg_shader_record_count; i += 1) {
        if (kg_shader_records[i].id == id) {
            return kg_shader_records[i].has_normal_attribute;
        }
    }
    return false;
}

static uint32_t kg_shader_required_uniform_mask(uint32_t id) {
    for (int i = 0; i < kg_shader_record_count; i += 1) {
        if (kg_shader_records[i].id == id) {
            return kg_shader_records[i].required_uniform_mask;
        }
    }
    return 0;
}

static uint32_t kg_shader_available_uniform_mask(uint32_t id) {
    for (int i = 0; i < kg_shader_record_count; i += 1) {
        if (kg_shader_records[i].id == id) {
            return kg_shader_records[i].available_uniform_mask;
        }
    }
    return 0;
}

static kg_pipeline_record* kg_find_pipeline_record(uint32_t public_id) {
    for (int i = 0; i < kg_pipeline_record_count; i += 1) {
        if (kg_pipeline_records[i].public_id == public_id) {
            return &kg_pipeline_records[i];
        }
    }
    return NULL;
}

static uint32_t kg_record_pipeline(uint32_t draw_pipeline_id, uint32_t indexed_pipeline_id, bool has_position_attribute, uint32_t required_uniform_mask, uint32_t available_uniform_mask) {
    if (kg_pipeline_record_count >= 64) {
        return 0;
    }
    uint32_t public_id = kg_next_public_pipeline_id;
    kg_next_public_pipeline_id += 1;
    kg_pipeline_records[kg_pipeline_record_count].public_id = public_id;
    kg_pipeline_records[kg_pipeline_record_count].draw_pipeline_id = draw_pipeline_id;
    kg_pipeline_records[kg_pipeline_record_count].indexed_pipeline_id = indexed_pipeline_id;
    kg_pipeline_records[kg_pipeline_record_count].has_position_attribute = has_position_attribute;
    kg_pipeline_records[kg_pipeline_record_count].required_uniform_mask = required_uniform_mask;
    kg_pipeline_records[kg_pipeline_record_count].available_uniform_mask = available_uniform_mask;
    kg_pipeline_record_count += 1;
    return public_id;
}

static bool kg_pipeline_has_position_attribute(uint32_t public_id) {
    kg_pipeline_record* record = kg_find_pipeline_record(public_id);
    if (record != NULL) {
        return record->has_position_attribute;
    }
    return true;
}

static uint32_t kg_pipeline_uniform_target_mask(const kg_pipeline_record* record, int public_slot) {
    if (record == NULL) {
        return 0;
    }

    uint32_t target_mask = 0;
    if (public_slot == 0) {
        target_mask = record->available_uniform_mask & ((1u << 0) | (1u << 2));
    } else if (public_slot == 1) {
        target_mask = record->available_uniform_mask & ((1u << 1) | (1u << 3));
    } else if (public_slot >= 0 && public_slot < 32) {
        target_mask = record->available_uniform_mask & (1u << (uint32_t)public_slot);
    }

    if (target_mask == 0 && public_slot >= 0 && public_slot < 32) {
        target_mask = 1u << (uint32_t)public_slot;
    }
    return target_mask;
}

static kg_uniform_record* kg_find_uniform(uint32_t id) {
    if (id == 0) {
        return NULL;
    }
    for (int i = 0; i < 64; i += 1) {
        if (kg_uniform_records[i].active && kg_uniform_records[i].id == id) {
            return &kg_uniform_records[i];
        }
    }
    return NULL;
}

static kg_uniform_record* kg_alloc_uniform(void) {
    for (int i = 0; i < 64; i += 1) {
        if (!kg_uniform_records[i].active) {
            kg_uniform_records[i] = (kg_uniform_record){0};
            kg_uniform_records[i].active = true;
            kg_uniform_records[i].id = kg_next_uniform_id;
            kg_next_uniform_id += 1;
            return &kg_uniform_records[i];
        }
    }
    return NULL;
}

static kg_bind_group_record* kg_find_bind_group(uint32_t id) {
    if (id == 0) {
        return NULL;
    }
    for (int i = 0; i < 64; i += 1) {
        if (kg_bind_group_records[i].active && kg_bind_group_records[i].id == id) {
            return &kg_bind_group_records[i];
        }
    }
    return NULL;
}

static kg_bind_group_record* kg_alloc_bind_group(void) {
    for (int i = 0; i < 64; i += 1) {
        if (!kg_bind_group_records[i].active) {
            kg_bind_group_records[i] = (kg_bind_group_record){0};
            kg_bind_group_records[i].active = true;
            kg_bind_group_records[i].id = kg_next_bind_group_id;
            kg_next_bind_group_id += 1;
            return &kg_bind_group_records[i];
        }
    }
    return NULL;
}

static void kg_remove_pipeline_record(uint32_t public_id) {
    for (int i = 0; i < kg_pipeline_record_count; i += 1) {
        if (kg_pipeline_records[i].public_id == public_id) {
            kg_pipeline_records[i] = kg_pipeline_records[kg_pipeline_record_count - 1];
            kg_pipeline_record_count -= 1;
            return;
        }
    }
}

static void kg_ensure_triangle_vertex_buffer(void) {
    if (kg_triangle_vertex_buffer.id != 0) {
        return;
    }

    const float vertices[] = {
        0.0f, 0.55f,
        0.55f, -0.55f,
        -0.55f, -0.55f,
    };
    sg_buffer_desc desc = {0};
    desc.data.ptr = vertices;
    desc.data.size = sizeof(vertices);
    desc.label = "kira-graphics-default-triangle-vertices";
    kg_triangle_vertex_buffer = sg_make_buffer(&desc);
}

typedef struct {
    float x;
    float y;
    float r;
    float g;
    float b;
    float a;
} kg_ui_vertex;

static float kg_ui_ndc_x(float x) {
    if (kg_current_pass_width <= 0) {
        return 0.0f;
    }
    return (x / (float)kg_current_pass_width) * 2.0f - 1.0f;
}

static float kg_ui_ndc_y(float y) {
    if (kg_current_pass_height <= 0) {
        return 0.0f;
    }
    return 1.0f - (y / (float)kg_current_pass_height) * 2.0f;
}

static void kg_ui_ensure_pipeline(void) {
    if (kg_ui_pipeline.id != 0 && kg_ui_vertex_buffer.id != 0) {
        return;
    }

    if (kg_ui_shader.id == 0) {
        sg_shader_desc shader_desc = {0};
        shader_desc.vertex_func.source =
            "#version 330 core\n"
            "layout(location=0) in vec2 kira_attr_position;\n"
            "layout(location=1) in vec4 kira_attr_color;\n"
            "out vec4 v_color;\n"
            "void main() {\n"
            "  gl_Position = vec4(kira_attr_position, 0.0, 1.0);\n"
            "  v_color = kira_attr_color;\n"
            "}\n";
        shader_desc.fragment_func.source =
            "#version 330 core\n"
            "in vec4 v_color;\n"
            "out vec4 frag_color;\n"
            "void main() {\n"
            "  frag_color = v_color;\n"
            "}\n";
        shader_desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        shader_desc.attrs[0].glsl_name = "kira_attr_position";
        shader_desc.attrs[1].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        shader_desc.attrs[1].glsl_name = "kira_attr_color";
        shader_desc.label = "kira-graphics-immediate-2d-shader";
        kg_ui_shader = sg_make_shader(&shader_desc);
    }

    if (kg_ui_pipeline.id == 0) {
        sg_swapchain swapchain = sglue_swapchain();
        sg_pipeline_desc pipeline_desc = {0};
        pipeline_desc.shader = kg_ui_shader;
        pipeline_desc.layout.buffers[0].stride = sizeof(kg_ui_vertex);
        pipeline_desc.layout.attrs[0].buffer_index = 0;
        pipeline_desc.layout.attrs[0].offset = offsetof(kg_ui_vertex, x);
        pipeline_desc.layout.attrs[0].format = SG_VERTEXFORMAT_FLOAT2;
        pipeline_desc.layout.attrs[1].buffer_index = 0;
        pipeline_desc.layout.attrs[1].offset = offsetof(kg_ui_vertex, r);
        pipeline_desc.layout.attrs[1].format = SG_VERTEXFORMAT_FLOAT4;
        pipeline_desc.colors[0].pixel_format = swapchain.color_format;
        pipeline_desc.colors[0].blend.enabled = true;
        pipeline_desc.colors[0].blend.src_factor_rgb = SG_BLENDFACTOR_SRC_ALPHA;
        pipeline_desc.colors[0].blend.dst_factor_rgb = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
        pipeline_desc.colors[0].blend.op_rgb = SG_BLENDOP_ADD;
        pipeline_desc.colors[0].blend.src_factor_alpha = SG_BLENDFACTOR_ONE;
        pipeline_desc.colors[0].blend.dst_factor_alpha = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
        pipeline_desc.colors[0].blend.op_alpha = SG_BLENDOP_ADD;
        pipeline_desc.primitive_type = SG_PRIMITIVETYPE_TRIANGLES;
        pipeline_desc.cull_mode = SG_CULLMODE_NONE;
        pipeline_desc.face_winding = SG_FACEWINDING_CCW;
        pipeline_desc.sample_count = swapchain.sample_count;
        pipeline_desc.label = "kira-graphics-immediate-2d-pipeline";
        kg_ui_pipeline = sg_make_pipeline(&pipeline_desc);
    }

    if (kg_ui_vertex_buffer.id == 0) {
        sg_buffer_desc buffer_desc = {0};
        buffer_desc.usage.vertex_buffer = true;
        buffer_desc.usage.stream_update = true;
        buffer_desc.size = sizeof(kg_ui_vertex) * 4096;
        buffer_desc.label = "kira-graphics-immediate-2d-vertices";
        kg_ui_vertex_buffer = sg_make_buffer(&buffer_desc);
    }
}

static void kg_ui_draw_vertices(const kg_ui_vertex* vertices, int count) {
    if (count <= 0) {
        return;
    }
    kg_ui_ensure_pipeline();
    sg_range data = { vertices, (size_t)count * sizeof(kg_ui_vertex) };
    sg_update_buffer(kg_ui_vertex_buffer, &data);
    sg_apply_pipeline(kg_ui_pipeline);
    sg_bindings bindings = {0};
    bindings.vertex_buffers[0] = kg_ui_vertex_buffer;
    sg_apply_bindings(&bindings);
    sg_draw(0, count, 1);
}

static kg_ui_clip_rect kg_ui_intersect_clip(kg_ui_clip_rect a, kg_ui_clip_rect b) {
    float left = a.x > b.x ? a.x : b.x;
    float top = a.y > b.y ? a.y : b.y;
    float right_a = a.x + a.w;
    float right_b = b.x + b.w;
    float bottom_a = a.y + a.h;
    float bottom_b = b.y + b.h;
    float right = right_a < right_b ? right_a : right_b;
    float bottom = bottom_a < bottom_b ? bottom_a : bottom_b;
    kg_ui_clip_rect result = { left, top, right > left ? right - left : 0.0f, bottom > top ? bottom - top : 0.0f };
    return result;
}

void kg_ui_push_clip(float x, float y, float w, float h, float radius) {
    (void)radius;
    if (kg_ui_clip_depth >= 32) {
        return;
    }
    kg_ui_clip_rect clip = { x, y, w, h };
    if (kg_ui_clip_depth > 0) {
        clip = kg_ui_intersect_clip(kg_ui_clip_stack[kg_ui_clip_depth - 1], clip);
    }
    kg_ui_clip_stack[kg_ui_clip_depth] = clip;
    kg_ui_clip_depth += 1;
    sg_apply_scissor_rect((int)clip.x, (int)clip.y, (int)clip.w, (int)clip.h, true);
}

void kg_ui_pop_clip(void) {
    if (kg_ui_clip_depth <= 0) {
        sg_apply_scissor_rect(0, 0, kg_current_pass_width, kg_current_pass_height, true);
        return;
    }
    kg_ui_clip_depth -= 1;
    if (kg_ui_clip_depth == 0) {
        sg_apply_scissor_rect(0, 0, kg_current_pass_width, kg_current_pass_height, true);
    } else {
        kg_ui_clip_rect clip = kg_ui_clip_stack[kg_ui_clip_depth - 1];
        sg_apply_scissor_rect((int)clip.x, (int)clip.y, (int)clip.w, (int)clip.h, true);
    }
}

void kg_ui_draw_surface(float x, float y, float w, float h, float r, float g, float b, float a, float border_r, float border_g, float border_b, float border_a, float border_width, float radius) {
    (void)radius;
    if (w <= 0.0f || h <= 0.0f) {
        return;
    }
    kg_ui_vertex fill[6] = {
        { kg_ui_ndc_x(x), kg_ui_ndc_y(y), r, g, b, a },
        { kg_ui_ndc_x(x + w), kg_ui_ndc_y(y), r, g, b, a },
        { kg_ui_ndc_x(x + w), kg_ui_ndc_y(y + h), r, g, b, a },
        { kg_ui_ndc_x(x), kg_ui_ndc_y(y), r, g, b, a },
        { kg_ui_ndc_x(x + w), kg_ui_ndc_y(y + h), r, g, b, a },
        { kg_ui_ndc_x(x), kg_ui_ndc_y(y + h), r, g, b, a },
    };
    kg_ui_draw_vertices(fill, 6);

    if (border_width > 0.0f && border_a > 0.0f) {
        float bw = border_width;
        kg_ui_draw_surface(x, y, w, bw, border_r, border_g, border_b, border_a, 0, 0, 0, 0, 0, 0);
        kg_ui_draw_surface(x, y + h - bw, w, bw, border_r, border_g, border_b, border_a, 0, 0, 0, 0, 0, 0);
        kg_ui_draw_surface(x, y, bw, h, border_r, border_g, border_b, border_a, 0, 0, 0, 0, 0, 0);
        kg_ui_draw_surface(x + w - bw, y, bw, h, border_r, border_g, border_b, border_a, 0, 0, 0, 0, 0, 0);
    }
}

void kg_ui_draw_glow(float x, float y, float w, float h, float r, float g, float b, float a, float radius, float intensity) {
    float spread = radius > 1.0f ? radius : 1.0f;
    float alpha = a * intensity * 0.25f;
    kg_ui_draw_surface(x - spread, y - spread, w + spread * 2.0f, h + spread * 2.0f, r, g, b, alpha, 0, 0, 0, 0, 0, 0);
}

void kg_ui_draw_text(const char* text, float x, float y, float w, float h, float r, float g, float b, float a, float size) {
    if (text == NULL || text[0] == '\0') {
        return;
    }
    int len = (int)strlen(text);
    if (len > 64) {
        len = 64;
    }
    float glyph_w = size * 0.38f;
    float glyph_h = size * 0.72f;
    float gap = size * 0.18f;
    float cursor = x;
    for (int i = 0; i < len; i += 1) {
        if (text[i] == ' ') {
            cursor += glyph_w + gap;
            continue;
        }
        if (cursor + glyph_w > x + w) {
            break;
        }
        kg_ui_draw_surface(cursor, y + (h - glyph_h) * 0.5f, glyph_w, glyph_h, r, g, b, a, 0, 0, 0, 0, 0, 0);
        cursor += glyph_w + gap;
    }
}

static void kg_ensure_ui_demo_vertex_buffer(void) {
    if (kg_ui_demo_vertex_buffer.id != 0) {
        return;
    }

    const float vertices[] = {
        -0.44f, -0.24f,
        0.44f, -0.24f,
        0.44f, 0.24f,
        -0.44f, -0.24f,
        0.44f, 0.24f,
        -0.44f, 0.24f,

        -0.28f, 0.06f,
        0.28f, 0.06f,
        0.28f, 0.12f,
        -0.28f, 0.06f,
        0.28f, 0.12f,
        -0.28f, 0.12f,

        -0.28f, -0.08f,
        0.16f, -0.08f,
        0.16f, -0.02f,
        -0.28f, -0.08f,
        0.16f, -0.02f,
        -0.28f, -0.02f,
    };
    sg_buffer_desc desc = {0};
    desc.data.ptr = vertices;
    desc.data.size = sizeof(vertices);
    desc.label = "kira-graphics-ui-demo-vertices";
    kg_ui_demo_vertex_buffer = sg_make_buffer(&desc);
}

static sg_pixel_format kg_pixel_format(int64_t format) {
    switch (format) {
        case 2:
            return SG_PIXELFORMAT_RGBA16F;
        case 3:
            return SG_PIXELFORMAT_DEPTH_STENCIL;
        case 1:
        default:
            return SG_PIXELFORMAT_RGBA8;
    }
}

static sg_load_action kg_load_action(int64_t action) {
    switch (action) {
        case 2:
            return SG_LOADACTION_LOAD;
        case 3:
            return SG_LOADACTION_DONTCARE;
        case 1:
        default:
            return SG_LOADACTION_CLEAR;
    }
}

static sg_store_action kg_store_action(int64_t action) {
    switch (action) {
        case 2:
            return SG_STOREACTION_DONTCARE;
        case 1:
        default:
            return SG_STOREACTION_STORE;
    }
}

static sg_vertex_format kg_vertex_format(int64_t format) {
    switch (format) {
        case 2:
            return SG_VERTEXFORMAT_FLOAT3;
        case 3:
            return SG_VERTEXFORMAT_FLOAT4;
        case 1:
        default:
            return SG_VERTEXFORMAT_FLOAT2;
    }
}

static sg_primitive_type kg_primitive_type(int64_t topology) {
    switch (topology) {
        case 2:
            return SG_PRIMITIVETYPE_TRIANGLE_STRIP;
        case 3:
            return SG_PRIMITIVETYPE_LINES;
        case 1:
        default:
            return SG_PRIMITIVETYPE_TRIANGLES;
    }
}

static sg_cull_mode kg_cull_mode(int64_t cull_mode) {
    switch (cull_mode) {
        case 1:
            return SG_CULLMODE_FRONT;
        case 2:
            return SG_CULLMODE_BACK;
        case 0:
        default:
            return SG_CULLMODE_NONE;
    }
}

static sg_face_winding kg_face_winding(int64_t front_face) {
    switch (front_face) {
        case 1:
            return SG_FACEWINDING_CCW;
        case 2:
        default:
            return SG_FACEWINDING_CW;
    }
}

static sg_compare_func kg_compare_func(int64_t compare) {
    switch (compare) {
        case 0:
            return SG_COMPAREFUNC_NEVER;
        case 1:
            return SG_COMPAREFUNC_LESS;
        case 2:
            return SG_COMPAREFUNC_LESS_EQUAL;
        case 3:
            return SG_COMPAREFUNC_EQUAL;
        case 4:
            return SG_COMPAREFUNC_GREATER_EQUAL;
        case 5:
            return SG_COMPAREFUNC_GREATER;
        case 6:
            return SG_COMPAREFUNC_ALWAYS;
        default:
            return SG_COMPAREFUNC_ALWAYS;
    }
}

static sg_blend_state kg_blend_state(bool enabled, int64_t preset) {
    sg_blend_state blend = {0};
    blend.enabled = enabled;

    if (!enabled || preset == 1) {
        return blend;
    }

    switch (preset) {
        case 2:
            blend.src_factor_rgb = SG_BLENDFACTOR_SRC_ALPHA;
            blend.dst_factor_rgb = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
            blend.op_rgb = SG_BLENDOP_ADD;
            blend.src_factor_alpha = SG_BLENDFACTOR_ONE;
            blend.dst_factor_alpha = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
            blend.op_alpha = SG_BLENDOP_ADD;
            break;
        case 3:
            blend.src_factor_rgb = SG_BLENDFACTOR_ONE;
            blend.dst_factor_rgb = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
            blend.op_rgb = SG_BLENDOP_ADD;
            blend.src_factor_alpha = SG_BLENDFACTOR_ONE;
            blend.dst_factor_alpha = SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
            blend.op_alpha = SG_BLENDOP_ADD;
            break;
        case 4:
            blend.src_factor_rgb = SG_BLENDFACTOR_SRC_ALPHA;
            blend.dst_factor_rgb = SG_BLENDFACTOR_ONE;
            blend.op_rgb = SG_BLENDOP_ADD;
            blend.src_factor_alpha = SG_BLENDFACTOR_ONE;
            blend.dst_factor_alpha = SG_BLENDFACTOR_ONE;
            blend.op_alpha = SG_BLENDOP_ADD;
            break;
        default:
            break;
    }
    return blend;
}

static sg_buffer_usage kg_buffer_usage(int64_t usage) {
    sg_buffer_usage result = {0};
    result.immutable = true;
    if (usage == 2) {
        result.index_buffer = true;
    } else if (usage == 4) {
        result.storage_buffer = true;
    } else {
        result.vertex_buffer = true;
    }
    return result;
}

static sg_image_usage kg_image_usage(int64_t usage) {
    sg_image_usage result = {0};
    result.immutable = true;
    if (usage == 2 || usage == 3) {
        result.color_attachment = true;
    }
    if (usage == 4) {
        result.depth_stencil_attachment = true;
    }
    return result;
}

static char* kg_copy_string(const char* source) {
    if (source == NULL) {
        source = "";
    }
    const size_t length = strlen(source);
    char* copy = (char*)malloc(length + 1);
    if (copy == NULL) {
        return NULL;
    }
    memcpy(copy, source, length + 1);
    return copy;
}

static char* kg_join_shader_path(const char* directory, const char* asset, const char* suffix) {
    const char* safe_directory = (directory == NULL) ? "" : directory;
    const char* safe_asset = (asset == NULL) ? "" : asset;
    const char* safe_suffix = (suffix == NULL) ? "" : suffix;
    size_t directory_length = strlen(safe_directory);
    size_t asset_length = strlen(safe_asset);
    size_t suffix_length = strlen(safe_suffix);
    char separator = '/';
    bool needs_separator = directory_length > 0 && safe_directory[directory_length - 1] != '/' && safe_directory[directory_length - 1] != '\\';
    size_t total = directory_length + (needs_separator ? 1 : 0) + asset_length + suffix_length + 1;
    char* path = (char*)malloc(total);
    if (path == NULL) {
        return NULL;
    }
    path[0] = '\0';
    strcat(path, safe_directory);
    if (needs_separator) {
        size_t offset = strlen(path);
        path[offset] = separator;
        path[offset + 1] = '\0';
    }
    strcat(path, safe_asset);
    strcat(path, safe_suffix);
    return path;
}

static const char* kg_replace_shader_text(const char* source, const char* needle, const char* replacement) {
    if (source == NULL || needle == NULL || replacement == NULL) {
        return source;
    }
    const char* found = strstr(source, needle);
    if (found == NULL) {
        return source;
    }

    const size_t prefix_len = (size_t)(found - source);
    const size_t needle_len = strlen(needle);
    const size_t replacement_len = strlen(replacement);
    const size_t suffix_len = strlen(found + needle_len);
    char* result = (char*)malloc(prefix_len + replacement_len + suffix_len + 1);
    if (result == NULL) {
        return source;
    }

    memcpy(result, source, prefix_len);
    memcpy(result + prefix_len, replacement, replacement_len);
    memcpy(result + prefix_len + replacement_len, found + needle_len, suffix_len + 1);
    return result;
}

static const char* kg_prepare_shader_source_for_sokol(const char* source) {
    const char* prepared = source;
    prepared = kg_replace_shader_text(
        prepared,
        "layout(std140) uniform scene_Block {\n"
        "    mat4 viewProjection;\n"
        "    vec4 lightDirection;\n"
        "    vec4 lightColor;\n"
        "} scene;",
        "uniform SceneUniforms scene;");
    prepared = kg_replace_shader_text(
        prepared,
        "layout(std140) uniform object_Block {\n"
        "    mat4 model;\n"
        "    vec4 baseColor;\n"
        "} object;",
        "uniform ObjectUniforms object;");
    return prepared;
}

static void kg_strip_last_path_component(char* path) {
    if (path == NULL) {
        return;
    }
    size_t length = strlen(path);
    while (length > 0) {
        char ch = path[length - 1];
        if (ch == '/' || ch == '\\') {
            path[length - 1] = '\0';
            break;
        }
        length -= 1;
    }
}

static bool kg_executable_directory(char* buffer, size_t buffer_size) {
    if (buffer == NULL || buffer_size == 0) {
        return false;
    }
#if defined(_WIN32)
    DWORD length = GetModuleFileNameA(NULL, buffer, (DWORD)buffer_size);
    if (length == 0 || length >= buffer_size) {
        return false;
    }
    buffer[length] = '\0';
    kg_strip_last_path_component(buffer);
    return true;
#elif defined(__APPLE__)
    uint32_t size = (uint32_t)buffer_size;
    if (_NSGetExecutablePath(buffer, &size) != 0) {
        return false;
    }
    kg_strip_last_path_component(buffer);
    return true;
#elif defined(__linux__)
    ssize_t length = readlink("/proc/self/exe", buffer, buffer_size - 1);
    if (length <= 0 || (size_t)length >= buffer_size) {
        return false;
    }
    buffer[length] = '\0';
    kg_strip_last_path_component(buffer);
    return true;
#else
    return false;
#endif
}

static char* kg_project_relative_shader_path(const char* path) {
    char executable_directory[KG_PATH_BUFFER_SIZE];
    if (!kg_executable_directory(executable_directory, sizeof(executable_directory))) {
        return NULL;
    }
    kg_strip_last_path_component(executable_directory);
    if (executable_directory[0] == '\0') {
        return NULL;
    }
    const size_t directory_length = strlen(executable_directory);
    const size_t path_length = strlen(path);
    const size_t total = directory_length + 1 + path_length + 1;
    char* resolved_path = (char*)malloc(total);
    if (resolved_path == NULL) {
        return NULL;
    }
    memcpy(resolved_path, executable_directory, directory_length);
    resolved_path[directory_length] = '/';
    memcpy(resolved_path + directory_length + 1, path, path_length + 1);
    return resolved_path;
}

static kg_buffer_upload_record* kg_alloc_buffer_upload(bool is_index_buffer) {
    for (int i = 0; i < 64; i += 1) {
        if (!kg_buffer_upload_records[i].active) {
            kg_buffer_upload_records[i].active = true;
            kg_buffer_upload_records[i].is_index_buffer = is_index_buffer;
            kg_buffer_upload_records[i].usage = 0;
            kg_buffer_upload_records[i].stride = 0;
            kg_buffer_upload_records[i].float_count = 0;
            kg_buffer_upload_records[i].int_count = 0;
            kg_buffer_upload_records[i].float_values = NULL;
            kg_buffer_upload_records[i].int_values = NULL;
            kg_buffer_upload_records[i].label = NULL;
            return &kg_buffer_upload_records[i];
        }
    }
    return NULL;
}

static kg_buffer_upload_record* kg_find_buffer_upload(uint32_t upload_id) {
    if (upload_id == 0 || upload_id > 64) {
        return NULL;
    }
    kg_buffer_upload_record* record = &kg_buffer_upload_records[upload_id - 1];
    return record->active ? record : NULL;
}

static void kg_release_buffer_upload(kg_buffer_upload_record* record) {
    if (record == NULL) {
        return;
    }
    free(record->float_values);
    free(record->int_values);
    free(record->label);
    memset(record, 0, sizeof(*record));
}

static kg_texture_record* kg_find_texture(uint32_t texture_id) {
    for (int i = 0; i < kg_texture_record_count; i += 1) {
        if (kg_texture_records[i].image_id == texture_id) {
            return &kg_texture_records[i];
        }
    }
    return NULL;
}

static void kg_remove_texture(uint32_t texture_id) {
    for (int i = 0; i < kg_texture_record_count; i += 1) {
        if (kg_texture_records[i].image_id == texture_id) {
            kg_texture_records[i] = kg_texture_records[kg_texture_record_count - 1];
            kg_texture_record_count -= 1;
            return;
        }
    }
}

const char* kg_shader_source(const char* inline_source, const char* path) {
    if (path == NULL || path[0] == '\0') {
        return inline_source == NULL ? "" : inline_source;
    }

    const char* opened_path = path;
    char* fallback_path = NULL;
    FILE* file = fopen(path, "rb");
    if (file == NULL) {
        fallback_path = kg_project_relative_shader_path(path);
        if (fallback_path != NULL) {
            file = fopen(fallback_path, "rb");
            if (file != NULL) {
                opened_path = fallback_path;
            }
        }
    }
    if (file == NULL) {
        printf("Kira Graphics: could not open shader source '%s'\n", path);
        free(fallback_path);
        return "";
    }

    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        printf("Kira Graphics: could not seek shader source '%s'\n", opened_path);
        free(fallback_path);
        return "";
    }

    long length = ftell(file);
    if (length < 0) {
        fclose(file);
        printf("Kira Graphics: could not measure shader source '%s'\n", opened_path);
        free(fallback_path);
        return "";
    }

    rewind(file);

    char* buffer = (char*)malloc((size_t)length + 1);
    if (buffer == NULL) {
        fclose(file);
        printf("Kira Graphics: could not allocate shader source '%s'\n", opened_path);
        free(fallback_path);
        return "";
    }

    size_t read_count = fread(buffer, 1, (size_t)length, file);
    fclose(file);
    buffer[read_count] = '\0';
    free(fallback_path);
    return buffer;
}

void kg_setup(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    sg_desc desc = {0};
    desc.environment = sglue_environment();
    desc.logger.func = kg_sokol_log;
    sg_setup(&desc);
}

double kg_math_sqrt(double value) {
    return sqrt(value);
}

double kg_math_sin(double value) {
    return sin(value);
}

double kg_math_cos(double value) {
    return cos(value);
}

double kg_math_tan(double value) {
    return tan(value);
}

uint32_t kg_begin_float_buffer_upload(const char* label, int64_t usage, int64_t stride, int64_t count) {
    if (count < 0) {
        return 0;
    }
    kg_buffer_upload_record* record = kg_alloc_buffer_upload(false);
    if (record == NULL) {
        return 0;
    }
    record->usage = usage;
    record->stride = stride;
    record->float_count = count;
    record->float_values = (count > 0) ? (float*)calloc((size_t)count, sizeof(float)) : NULL;
    record->label = kg_copy_string(label);
    return (uint32_t)((record - kg_buffer_upload_records) + 1);
}

void kg_set_float_buffer_upload_value(uint32_t upload_id, int64_t index, double value) {
    kg_buffer_upload_record* record = kg_find_buffer_upload(upload_id);
    if (record == NULL || record->float_values == NULL) {
        return;
    }
    if (index < 0 || index >= record->float_count) {
        return;
    }
    record->float_values[index] = (float)value;
}

uint32_t kg_finalize_float_buffer_upload(uint32_t upload_id) {
    kg_buffer_upload_record* record = kg_find_buffer_upload(upload_id);
    if (record == NULL) {
        return 0;
    }

    sg_buffer_desc desc = {0};
    desc.label = record->label;
    desc.usage = kg_buffer_usage(record->usage);
    desc.size = (uint64_t)(record->float_count * (int64_t)sizeof(float));
    desc.data.ptr = record->float_values;
    desc.data.size = (size_t)desc.size;

    sg_buffer buffer = sg_make_buffer(&desc);
    uint32_t buffer_id = buffer.id;
    kg_release_buffer_upload(record);
    return buffer_id;
}

uint32_t kg_begin_index_buffer_upload(const char* label, int64_t usage, int64_t count) {
    if (count < 0) {
        return 0;
    }
    kg_buffer_upload_record* record = kg_alloc_buffer_upload(true);
    if (record == NULL) {
        return 0;
    }
    record->usage = usage;
    record->int_count = count;
    record->int_values = (count > 0) ? (uint32_t*)calloc((size_t)count, sizeof(uint32_t)) : NULL;
    record->label = kg_copy_string(label);
    return (uint32_t)((record - kg_buffer_upload_records) + 1);
}

void kg_set_index_buffer_upload_value(uint32_t upload_id, int64_t index, int64_t value) {
    kg_buffer_upload_record* record = kg_find_buffer_upload(upload_id);
    if (record == NULL || record->int_values == NULL) {
        return;
    }
    if (index < 0 || index >= record->int_count) {
        return;
    }
    record->int_values[index] = (uint32_t)value;
}

uint32_t kg_finalize_index_buffer_upload(uint32_t upload_id) {
    kg_buffer_upload_record* record = kg_find_buffer_upload(upload_id);
    if (record == NULL) {
        return 0;
    }

    sg_buffer_desc desc = {0};
    desc.label = record->label;
    desc.usage = kg_buffer_usage(record->usage == 0 ? 2 : record->usage);
    desc.size = (uint64_t)(record->int_count * (int64_t)sizeof(uint32_t));
    desc.data.ptr = record->int_values;
    desc.data.size = (size_t)desc.size;

    sg_buffer buffer = sg_make_buffer(&desc);
    uint32_t buffer_id = buffer.id;
    kg_release_buffer_upload(record);
    return buffer_id;
}

void kg_destroy_buffer_id(uint32_t buffer_id) {
    if (buffer_id == 0) {
        return;
    }
    sg_buffer buffer = { buffer_id };
    sg_destroy_buffer(buffer);
}

uint32_t kg_create_uniform_id(const char* label, int64_t expected_float_count) {
    if (expected_float_count <= 0) {
        printf("Kira Graphics: uniform buffer '%s' needs a positive expected float count\n", label ? label : "");
        return 0;
    }
    kg_uniform_record* record = kg_alloc_uniform();
    if (record == NULL) {
        printf("Kira Graphics: could not allocate uniform buffer '%s'; uniform table is full\n", label ? label : "");
        return 0;
    }
    record->expected_float_count = expected_float_count;
    record->float_count = expected_float_count;
    record->values = (float*)calloc((size_t)expected_float_count, sizeof(float));
    record->label = kg_copy_string(label);
    if (record->values == NULL) {
        printf("Kira Graphics: could not allocate uniform buffer '%s' payload\n", label ? label : "");
        record->active = false;
        free(record->label);
        record->label = NULL;
        return 0;
    }
    return record->id;
}

void kg_set_uniform_float(uint32_t uniform_id, int64_t index, double value) {
    kg_uniform_record* record = kg_find_uniform(uniform_id);
    if (record == NULL || record->values == NULL) {
        printf("Kira Graphics: uniform upload target %u is missing\n", uniform_id);
        return;
    }
    if (index < 0 || index >= record->expected_float_count) {
        printf("Kira Graphics: uniform buffer '%s' upload index %lld is outside expected float count %lld\n",
            record->label ? record->label : "",
            (long long)index,
            (long long)record->expected_float_count);
        return;
    }
    record->values[index] = (float)value;
}

uint32_t kg_finish_uniform_update(uint32_t uniform_id, int64_t float_count) {
    kg_uniform_record* record = kg_find_uniform(uniform_id);
    if (record == NULL) {
        printf("Kira Graphics: uniform update target %u is missing\n", uniform_id);
        return 0;
    }
    if (float_count != record->expected_float_count) {
        printf("Kira Graphics: uniform buffer '%s' upload size %lld floats does not match expected size %lld floats\n",
            record->label ? record->label : "",
            (long long)float_count,
            (long long)record->expected_float_count);
        return 0;
    }
    record->float_count = float_count;
    return 1;
}

void kg_destroy_uniform_id(uint32_t uniform_id) {
    kg_uniform_record* record = kg_find_uniform(uniform_id);
    if (record == NULL) {
        return;
    }
    free(record->values);
    free(record->label);
    *record = (kg_uniform_record){0};
}

uint32_t kg_create_bind_group_id(const char* label) {
    kg_bind_group_record* record = kg_alloc_bind_group();
    if (record == NULL) {
        printf("Kira Graphics: could not allocate bind group '%s'; bind-group table is full\n", label ? label : "");
        return 0;
    }
    record->label = kg_copy_string(label);
    return record->id;
}

uint32_t kg_set_bind_group_uniform(uint32_t bind_group_id, int64_t entry_index, int64_t uniform_slot, uint32_t uniform_id) {
    kg_bind_group_record* record = kg_find_bind_group(bind_group_id);
    if (record == NULL) {
        printf("Kira Graphics: bind group %u is missing while binding uniform %u\n", bind_group_id, uniform_id);
        return 0;
    }
    if (entry_index < 0 || entry_index >= 4) {
        printf("Kira Graphics: bind group '%s' uniform entry index %lld is outside the supported range 0..3\n",
            record->label ? record->label : "",
            (long long)entry_index);
        return 0;
    }
    if (uniform_slot < 0 || uniform_slot >= SG_MAX_UNIFORMBLOCK_BINDSLOTS) {
        printf("Kira Graphics: bind group '%s' uniform slot %lld is outside Sokol's supported uniform block range\n",
            record->label ? record->label : "",
            (long long)uniform_slot);
        return 0;
    }
    if (kg_find_uniform(uniform_id) == NULL) {
        printf("Kira Graphics: bind group '%s' references missing uniform buffer %u\n",
            record->label ? record->label : "",
            uniform_id);
        return 0;
    }
    record->uniform_ids[entry_index] = uniform_id;
    record->uniform_slots[entry_index] = (int)uniform_slot;
    if (entry_index + 1 > record->uniform_count) {
        record->uniform_count = (int)entry_index + 1;
    }
    return 1;
}

void kg_destroy_bind_group_id(uint32_t bind_group_id) {
    kg_bind_group_record* record = kg_find_bind_group(bind_group_id);
    if (record == NULL) {
        return;
    }
    free(record->label);
    *record = (kg_bind_group_record){0};
}

uint32_t kg_create_texture_id(const char* label, int64_t width, int64_t height, int64_t format, int64_t usage, int64_t sample_count, int64_t storage_mode) {
    (void)storage_mode;

    sg_image_desc desc = {0};
    desc.type = SG_IMAGETYPE_2D;
    desc.usage = kg_image_usage(usage);
    desc.width = (int)width;
    desc.height = (int)height;
    desc.num_slices = 1;
    desc.num_mipmaps = 1;
    desc.pixel_format = kg_pixel_format(format);
    desc.sample_count = (int)((sample_count > 0) ? sample_count : 1);
    desc.label = label;

    sg_image image = sg_make_image(&desc);
    if (image.id == 0) {
        return 0;
    }

    uint32_t color_view_id = 0;
    uint32_t depth_view_id = 0;
    if (usage == 2 || usage == 3) {
        sg_view_desc color_view_desc = {0};
        color_view_desc.color_attachment.image = image;
        color_view_desc.label = label;
        color_view_id = sg_make_view(&color_view_desc).id;
    }
    if (usage == 4) {
        sg_view_desc depth_view_desc = {0};
        depth_view_desc.depth_stencil_attachment.image = image;
        depth_view_desc.label = label;
        depth_view_id = sg_make_view(&depth_view_desc).id;
    }

    if (kg_texture_record_count < 64) {
        kg_texture_record* record = &kg_texture_records[kg_texture_record_count];
        record->image_id = image.id;
        record->color_view_id = color_view_id;
        record->depth_view_id = depth_view_id;
        record->width = width;
        record->height = height;
        record->sample_count = sample_count;
        record->format = format;
        record->usage = usage;
        kg_texture_record_count += 1;
    }
    return image.id;
}

void kg_destroy_texture_id(uint32_t texture_id) {
    if (texture_id == 0) {
        return;
    }
    kg_texture_record* record = kg_find_texture(texture_id);
    if (record != NULL) {
        if (record->color_view_id != 0) {
            sg_view color_view = { record->color_view_id };
            sg_destroy_view(color_view);
        }
        if (record->depth_view_id != 0) {
            sg_view depth_view = { record->depth_view_id };
            sg_destroy_view(depth_view);
        }
    }
    sg_image image = { texture_id };
    sg_destroy_image(image);
    kg_remove_texture(texture_id);
}

static void kg_uniform_member(sg_shader_uniform_block* block, int index, sg_uniform_type type, const char* name) {
    block->glsl_uniforms[index].type = type;
    block->glsl_uniforms[index].array_count = 1;
    block->glsl_uniforms[index].glsl_name = name;
}

static bool kg_shader_source_uses_resource(const char* source, const char* resource_name) {
    if (source == NULL || resource_name == NULL) {
        return false;
    }
    char needle[64];
    snprintf(needle, sizeof(needle), "%s.", resource_name);
    return strstr(source, needle) != NULL;
}

static uint32_t kg_configure_uniform_blocks(sg_shader_desc* desc, const char* vertex_source, const char* fragment_source) {
    uint32_t available_mask = 0;
    const bool vertex_uses_scene = kg_shader_source_uses_resource(vertex_source, "scene");
    const bool vertex_uses_object = kg_shader_source_uses_resource(vertex_source, "object");
    const bool fragment_uses_scene = kg_shader_source_uses_resource(fragment_source, "scene");
    const bool fragment_uses_object = kg_shader_source_uses_resource(fragment_source, "object");

    if (vertex_uses_scene) {
        sg_shader_uniform_block* block = &desc->uniform_blocks[0];
        block->stage = SG_SHADERSTAGE_VERTEX;
        block->size = 96;
        block->layout = SG_UNIFORMLAYOUT_STD140;
        kg_uniform_member(block, 0, SG_UNIFORMTYPE_MAT4, "scene.viewProjection");
        kg_uniform_member(block, 1, SG_UNIFORMTYPE_FLOAT4, "scene.lightDirection");
        kg_uniform_member(block, 2, SG_UNIFORMTYPE_FLOAT4, "scene.lightColor");
        available_mask |= 1u << 0;
    }

    if (vertex_uses_object) {
        sg_shader_uniform_block* block = &desc->uniform_blocks[1];
        block->stage = SG_SHADERSTAGE_VERTEX;
        block->size = 80;
        block->layout = SG_UNIFORMLAYOUT_STD140;
        kg_uniform_member(block, 0, SG_UNIFORMTYPE_MAT4, "object.model");
        kg_uniform_member(block, 1, SG_UNIFORMTYPE_FLOAT4, "object.baseColor");
        available_mask |= 1u << 1;
    }

    if (fragment_uses_scene) {
        sg_shader_uniform_block* block = &desc->uniform_blocks[2];
        block->stage = SG_SHADERSTAGE_FRAGMENT;
        block->size = 96;
        block->layout = SG_UNIFORMLAYOUT_STD140;
        kg_uniform_member(block, 0, SG_UNIFORMTYPE_MAT4, "scene.viewProjection");
        kg_uniform_member(block, 1, SG_UNIFORMTYPE_FLOAT4, "scene.lightDirection");
        kg_uniform_member(block, 2, SG_UNIFORMTYPE_FLOAT4, "scene.lightColor");
        available_mask |= 1u << 2;
    }

    if (fragment_uses_object) {
        sg_shader_uniform_block* block = &desc->uniform_blocks[3];
        block->stage = SG_SHADERSTAGE_FRAGMENT;
        block->size = 80;
        block->layout = SG_UNIFORMLAYOUT_STD140;
        kg_uniform_member(block, 0, SG_UNIFORMTYPE_MAT4, "object.model");
        kg_uniform_member(block, 1, SG_UNIFORMTYPE_FLOAT4, "object.baseColor");
        available_mask |= 1u << 3;
    }

    return available_mask;
}

static uint32_t kg_uniform_mask_from_shader_source(const char* vertex_source, const char* fragment_source) {
    uint32_t mask = 0;
    const bool has_scene = kg_shader_source_uses_resource(vertex_source, "scene") || kg_shader_source_uses_resource(fragment_source, "scene");
    const bool has_object = kg_shader_source_uses_resource(vertex_source, "object") || kg_shader_source_uses_resource(fragment_source, "object");
    if (has_scene) {
        mask |= 1u << 0;
    }
    if (has_object) {
        mask |= 1u << 1;
    }
    return mask;
}

uint32_t kg_make_shader(const char* label, const char* vertex_source, const char* fragment_source, const char* vertex_path, const char* fragment_path) {
    sg_shader_desc desc = {0};
    desc.vertex_func.source = kg_prepare_shader_source_for_sokol(kg_shader_source(vertex_source, vertex_path));
    desc.fragment_func.source = kg_prepare_shader_source_for_sokol(kg_shader_source(fragment_source, fragment_path));
    bool has_position_attribute = strstr(desc.vertex_func.source, "kira_attr_position") != NULL;
    bool has_normal_attribute = strstr(desc.vertex_func.source, "kira_attr_normal") != NULL;
    uint32_t required_uniform_mask = kg_uniform_mask_from_shader_source(desc.vertex_func.source, desc.fragment_func.source);
    if (has_position_attribute) {
        desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        desc.attrs[0].glsl_name = "kira_attr_position";
    }
    if (has_normal_attribute) {
        desc.attrs[1].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        desc.attrs[1].glsl_name = "kira_attr_normal";
    }
    uint32_t available_uniform_mask = kg_configure_uniform_blocks(&desc, desc.vertex_func.source, desc.fragment_func.source);
    desc.label = label;
    uint32_t shader_id = sg_make_shader(&desc).id;
    kg_record_shader(shader_id, has_position_attribute, has_normal_attribute, required_uniform_mask, available_uniform_mask);
    return shader_id;
}

uint32_t kg_make_ksl_shader(const char* label, const char* asset, const char* directory) {
    char* vertex_path = kg_join_shader_path(directory, asset, ".vert.glsl");
    char* fragment_path = kg_join_shader_path(directory, asset, ".frag.glsl");
    uint32_t shader_id = kg_make_shader(label, "", "", vertex_path ? vertex_path : "", fragment_path ? fragment_path : "");
    free(vertex_path);
    free(fragment_path);
    return shader_id;
}

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
) {
    sg_swapchain swapchain = sglue_swapchain();
    sg_pipeline_desc desc = {0};
    desc.shader.id = shader_id;
    desc.layout.buffers[0].stride = (int)vertex_stride;
    desc.layout.buffers[0].step_func = SG_VERTEXSTEP_PER_VERTEX;
    desc.layout.buffers[0].step_rate = 1;

    const bool shader_has_normal = kg_shader_has_normal_attribute(shader_id);
    if (shader_has_normal && vertex_stride >= 24 && attribute_count >= 2) {
        if (attr0_format <= 0) {
            attr0_format = 2;
        }
        if (attr1_format <= 1 && attr1_offset == 0) {
            attr1_format = 2;
            attr1_offset = 12;
        }
    }

    if (attribute_count > 0) {
        desc.layout.attrs[0].buffer_index = 0;
        desc.layout.attrs[0].offset = (int)attr0_offset;
        desc.layout.attrs[0].format = kg_vertex_format(attr0_format);
    }
    if (attribute_count > 1) {
        desc.layout.attrs[1].buffer_index = 0;
        desc.layout.attrs[1].offset = (int)attr1_offset;
        desc.layout.attrs[1].format = kg_vertex_format(attr1_format);
    }
    if (attribute_count > 2) {
        desc.layout.attrs[2].buffer_index = 0;
        desc.layout.attrs[2].offset = (int)attr2_offset;
        desc.layout.attrs[2].format = kg_vertex_format(attr2_format);
    }
    if (attribute_count > 3) {
        desc.layout.attrs[3].buffer_index = 0;
        desc.layout.attrs[3].offset = (int)attr3_offset;
        desc.layout.attrs[3].format = kg_vertex_format(attr3_format);
    }

    (void)attr0_location;
    (void)attr1_location;
    (void)attr2_location;
    (void)attr3_location;

    desc.color_count = (color_target_count > 0) ? (int)color_target_count : 1;
    if (desc.color_count > 0) {
        desc.colors[0].pixel_format = (color_format == 1) ? swapchain.color_format : kg_pixel_format(color_format);
        desc.colors[0].write_mask = SG_COLORMASK_RGBA;
        desc.colors[0].blend = kg_blend_state(blend_enabled != 0, blend_preset);
    }
    desc.primitive_type = kg_primitive_type(topology);
    desc.cull_mode = kg_cull_mode(cull_mode);
    desc.face_winding = kg_face_winding(front_face);
    desc.sample_count = swapchain.sample_count;
    desc.label = label;

    if (depth_enabled != 0) {
        desc.depth.pixel_format = swapchain.depth_format;
        desc.depth.compare = kg_compare_func(depth_compare);
        desc.depth.write_enabled = depth_write_enabled != 0;
    }

    sg_pipeline_desc draw_desc = desc;
    draw_desc.index_type = SG_INDEXTYPE_NONE;
    uint32_t draw_pipeline_id = sg_make_pipeline(&draw_desc).id;

    sg_pipeline_desc indexed_desc = desc;
    indexed_desc.index_type = SG_INDEXTYPE_UINT32;
    uint32_t indexed_pipeline_id = sg_make_pipeline(&indexed_desc).id;

    uint32_t pipeline_id = kg_record_pipeline(draw_pipeline_id, indexed_pipeline_id, attribute_count > 0 || kg_shader_has_position_attribute(shader_id), kg_shader_required_uniform_mask(shader_id), kg_shader_available_uniform_mask(shader_id));
    if (label != NULL && strstr(label, "ui-demo") != NULL) {
        kg_ui_demo_pipeline_id = pipeline_id;
    }
    return pipeline_id;
}

uint32_t kg_make_pipeline(uint32_t shader_id, const char* label) {
    return kg_make_pipeline_detailed(shader_id, label, sizeof(float) * 2, 1, 0, 1, 0, 1, 1, 0, 2, 1, 0, 3, 1, 0, 1, 1, 0, 1, 0, 0, 6, 3, 0, 2, 1);
}

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
) {
    (void)color_mip_level;
    (void)color_array_layer;
    (void)resolve_mip_level;
    (void)resolve_array_layer;
    (void)depth_read_only;
    (void)stencil_read_only;

    kg_current_pass_active = false;
    kg_current_pass_width = 0;
    kg_current_pass_height = 0;

    sg_pass pass = {0};
    pass.label = label;
    pass.action.colors[0].load_action = kg_load_action(color_load_action);
    pass.action.colors[0].store_action = kg_store_action(color_store_action);
    pass.action.colors[0].clear_value = (sg_color){ (float)clear_r, (float)clear_g, (float)clear_b, (float)clear_a };

    if (color_target_kind == 1) {
        if (color_texture_id != 0) {
            printf("Kira Graphics: swapchain render pass cannot use an explicit color texture\n");
            return 0;
        }
        if (has_resolve_target != 0) {
            printf("Kira Graphics: swapchain render pass does not support resolve attachments\n");
            return 0;
        }
        if (has_depth_attachment != 0 && depth_texture_id != 0) {
            printf("Kira Graphics: render pass mixes swapchain color with explicit depth texture; use swapchain/default depth or render to an offscreen color texture\n");
            return 0;
        }
        if (has_stencil_attachment != 0 && stencil_texture_id != 0) {
            printf("Kira Graphics: swapchain render pass does not support an explicit stencil texture\n");
            return 0;
        }
        sg_swapchain sw = sglue_swapchain();
        if (has_depth_attachment != 0 && sw.depth_format == SG_PIXELFORMAT_NONE) {
            printf("Kira Graphics: swapchain render pass requested depth, but the swapchain has no depth buffer\n");
            return 0;
        }
        int w = sw.width;
        int h = sw.height;
        pass.swapchain = sw;
        if (has_depth_attachment != 0) {
            pass.action.depth.load_action = kg_load_action(depth_load_action);
            pass.action.depth.store_action = kg_store_action(depth_store_action);
            pass.action.depth.clear_value = (float)clear_depth;
        }
        if (has_stencil_attachment != 0) {
            pass.action.stencil.load_action = kg_load_action(stencil_load_action);
            pass.action.stencil.store_action = kg_store_action(stencil_store_action);
            pass.action.stencil.clear_value = (uint8_t)clear_stencil;
        }
        sg_begin_pass(&pass);
        kg_current_pass_active = _sg.cur_pass.in_pass && _sg.cur_pass.valid;
        if (!kg_current_pass_active) {
            printf("Kira Graphics: swapchain render pass could not be activated in Sokol\n");
            return 0;
        }
        kg_current_pass_width = w;
        kg_current_pass_height = h;
        return 1;
    } else if (color_target_kind == 2) {
        if (color_texture_id == 0) {
            printf("Kira Graphics: offscreen render pass needs an explicit color texture\n");
            return 0;
        }
        kg_texture_record* color_record = kg_find_texture(color_texture_id);
        if (color_record == NULL || color_record->color_view_id == 0) {
            printf("Kira Graphics: offscreen render pass color texture %u is not available as a color attachment\n", color_texture_id);
            return 0;
        }
        pass.attachments.colors[0].id = color_record->color_view_id;
        if (has_resolve_target != 0) {
            if (resolve_texture_id == 0) {
                printf("Kira Graphics: offscreen render pass requested a resolve target, but no resolve texture was provided\n");
                return 0;
            }
            kg_texture_record* resolve_record = kg_find_texture(resolve_texture_id);
            if (resolve_record == NULL || resolve_record->color_view_id == 0) {
                printf("Kira Graphics: offscreen render pass resolve texture %u is not available as a color attachment\n", resolve_texture_id);
                return 0;
            }
            pass.attachments.resolves[0].id = resolve_record->color_view_id;
        }
        if (has_depth_attachment != 0) {
            if (depth_texture_id == 0) {
                printf("Kira Graphics: offscreen render pass has depth enabled, but no depth texture was provided\n");
                return 0;
            }
            kg_texture_record* depth_record = kg_find_texture(depth_texture_id);
            if (depth_record == NULL || depth_record->depth_view_id == 0) {
                printf("Kira Graphics: offscreen render pass depth texture %u is not available as a depth attachment\n", depth_texture_id);
                return 0;
            }
            pass.attachments.depth_stencil.id = depth_record->depth_view_id;
            pass.action.depth.load_action = kg_load_action(depth_load_action);
            pass.action.depth.store_action = kg_store_action(depth_store_action);
            pass.action.depth.clear_value = (float)clear_depth;
        }
        if (has_stencil_attachment != 0) {
            if (stencil_texture_id == 0) {
                printf("Kira Graphics: offscreen render pass has stencil enabled, but no stencil texture was provided\n");
                return 0;
            }
            kg_texture_record* stencil_record = kg_find_texture(stencil_texture_id);
            if (stencil_record == NULL || stencil_record->depth_view_id == 0) {
                printf("Kira Graphics: offscreen render pass stencil texture %u is not available as a stencil attachment\n", stencil_texture_id);
                return 0;
            }
            pass.attachments.depth_stencil.id = stencil_record->depth_view_id;
            pass.action.stencil.load_action = kg_load_action(stencil_load_action);
            pass.action.stencil.store_action = kg_store_action(stencil_store_action);
            pass.action.stencil.clear_value = (uint8_t)clear_stencil;
        }
        kg_current_pass_width = (int)color_record->width;
        kg_current_pass_height = (int)color_record->height;
        sg_begin_pass(&pass);
        kg_current_pass_active = _sg.cur_pass.in_pass && _sg.cur_pass.valid;
        if (!kg_current_pass_active) {
            printf("Kira Graphics: offscreen render pass could not be activated in Sokol\n");
            return 0;
        }
        return 1;
    }

    printf("Kira Graphics: render pass has unsupported color target kind %lld\n", (long long)color_target_kind);
    return 0;
}

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
) {
    if (!kg_current_pass_active || !_sg.cur_pass.in_pass || !_sg.cur_pass.valid) {
        printf("Kira Graphics: draw skipped because no render pass is currently active\n");
        return 0;
    }

    kg_pipeline_record* pipeline_record = kg_find_pipeline_record(pipeline_id);
    if (pipeline_record == NULL) {
        printf("Kira Graphics: draw skipped because pipeline public id %u was not registered\n", pipeline_id);
        return 0;
    }

    const bool wants_indexed = (index_count > 0) && (has_index_buffer != 0);
    uint32_t active_pipeline_id = wants_indexed ? pipeline_record->indexed_pipeline_id : pipeline_record->draw_pipeline_id;
    if (active_pipeline_id == 0) {
        printf("Kira Graphics: draw skipped because active pipeline id resolved to 0 (public=%u indexed=%d)\n", pipeline_id, wants_indexed ? 1 : 0);
        return 0;
    }

    if (kg_current_pass_width > 0 && kg_current_pass_height > 0) {
        sg_apply_viewport(0, 0, kg_current_pass_width, kg_current_pass_height, false);
        sg_apply_scissor_rect(0, 0, kg_current_pass_width, kg_current_pass_height, false);
    }

    sg_pipeline pipeline = { active_pipeline_id };
    sg_apply_pipeline(pipeline);

    sg_bindings bindings = {0};
    if (has_vertex_buffer != 0) {
        bindings.vertex_buffers[0].id = vertex_buffer_id;
        bindings.vertex_buffer_offsets[0] = 0;
    } else if (kg_pipeline_has_position_attribute(pipeline_id)) {
        if (pipeline_id == kg_ui_demo_pipeline_id) {
            kg_ensure_ui_demo_vertex_buffer();
            bindings.vertex_buffers[0] = kg_ui_demo_vertex_buffer;
        } else {
            kg_ensure_triangle_vertex_buffer();
            bindings.vertex_buffers[0] = kg_triangle_vertex_buffer;
        }
        bindings.vertex_buffer_offsets[0] = 0;
    }
    if (has_index_buffer != 0) {
        bindings.index_buffer.id = index_buffer_id;
        bindings.index_buffer_offset = 0;
    }
    sg_apply_bindings(&bindings);

    uint32_t applied_uniform_mask = 0;
    uint32_t bind_group_ids[4] = { bind_group0_id, bind_group1_id, bind_group2_id, bind_group3_id };
    int64_t has_bind_groups[4] = { has_bind_group0, has_bind_group1, has_bind_group2, has_bind_group3 };
    for (int group_index = 0; group_index < 4; group_index += 1) {
        if (has_bind_groups[group_index] == 0) {
            continue;
        }
        kg_bind_group_record* group = kg_find_bind_group(bind_group_ids[group_index]);
        if (group == NULL) {
            printf("Kira Graphics: bind group slot %d references missing bind group %u\n", group_index, bind_group_ids[group_index]);
            return 0;
        }
        for (int entry_index = 0; entry_index < group->uniform_count; entry_index += 1) {
            uint32_t uniform_id = group->uniform_ids[entry_index];
            if (uniform_id == 0) {
                continue;
            }
            kg_uniform_record* uniform = kg_find_uniform(uniform_id);
            if (uniform == NULL || uniform->values == NULL) {
                printf("Kira Graphics: bind group '%s' references missing uniform buffer %u\n",
                    group->label ? group->label : "",
                    uniform_id);
                return 0;
            }
            const size_t byte_size = (size_t)(uniform->float_count * (int64_t)sizeof(float));
            if (uniform->float_count != uniform->expected_float_count || byte_size == 0) {
                printf("Kira Graphics: uniform buffer '%s' has invalid upload size %lld floats; expected %lld floats\n",
                    uniform->label ? uniform->label : "",
                    (long long)uniform->float_count,
                    (long long)uniform->expected_float_count);
                return 0;
            }
            const size_t expected_slot_size =
                (group->uniform_slots[entry_index] == 0) ? 96u :
                (group->uniform_slots[entry_index] == 1) ? 80u :
                byte_size;
            if (byte_size != expected_slot_size) {
                printf("Kira Graphics: uniform buffer '%s' upload size %zu bytes does not match expected size %zu bytes for uniform slot %d\n",
                    uniform->label ? uniform->label : "",
                    byte_size,
                    expected_slot_size,
                    group->uniform_slots[entry_index]);
                return 0;
            }
            sg_range uniform_range = { uniform->values, byte_size };
            uint32_t target_mask = kg_pipeline_uniform_target_mask(pipeline_record, group->uniform_slots[entry_index]);
            for (int target_slot = 0; target_slot < 32; target_slot += 1) {
                if ((target_mask & (1u << (uint32_t)target_slot)) == 0) {
                    continue;
                }
                sg_apply_uniforms(target_slot, &uniform_range);
            }
            applied_uniform_mask |= 1u << group->uniform_slots[entry_index];
        }
    }

    if ((pipeline_record->required_uniform_mask & applied_uniform_mask) != pipeline_record->required_uniform_mask) {
        printf("Kira Graphics: pipeline %u expects uniform slots mask 0x%x but only mask 0x%x was bound\n",
            pipeline_id,
            pipeline_record->required_uniform_mask,
            applied_uniform_mask);
        return 0;
    }

    if (index_count > 0) {
        sg_draw(0, (int)index_count, (int)instance_count);
    } else if (vertex_count > 0) {
        sg_draw(0, (int)vertex_count, (int)instance_count);
    }
    return 1;
}

void kg_apply_pipeline_and_draw(uint32_t pipeline_id, int vertex_count, int instance_count) {
    kg_apply_pipeline_bindings_and_draw(pipeline_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, vertex_count, 0, instance_count);
}

void kg_log_submit_state(
    uint32_t pipeline_id,
    uint32_t vertex_buffer_id,
    int64_t has_vertex_buffer,
    uint32_t index_buffer_id,
    int64_t has_index_buffer,
    int64_t vertex_count,
    int64_t index_count,
    int64_t instance_count
) {
    (void)pipeline_id;
    (void)vertex_buffer_id;
    (void)has_vertex_buffer;
    (void)index_buffer_id;
    (void)has_index_buffer;
    (void)vertex_count;
    (void)index_count;
    (void)instance_count;
}

void kg_end_pass_and_commit(void) {
    if (!_sg.cur_pass.in_pass) {
        printf("Kira Graphics: end pass skipped because no render pass is currently active\n");
        kg_current_pass_active = false;
        kg_current_pass_width = 0;
        kg_current_pass_height = 0;
        return;
    }
    sg_end_pass();
    sg_commit();
    kg_current_pass_active = false;
    kg_current_pass_width = 0;
    kg_current_pass_height = 0;
}

void kg_begin_swapchain_pass(float r, float g, float b, float a) {
    kg_begin_render_pass("compat-swapchain-pass", 1, 0, 0, 0, 1, 1, r, g, b, a, 0, 0, 0, 0, 0, 0, 1, 1, 1.0, 0, 0, 0, 1, 1, 0, 0);
}

void kg_destroy_shader_id(uint32_t shader_id) {
    sg_shader shader = { shader_id };
    sg_destroy_shader(shader);
}

void kg_destroy_pipeline_id(uint32_t pipeline_id) {
    kg_pipeline_record* record = kg_find_pipeline_record(pipeline_id);
    if (record == NULL) {
        return;
    }
    if (record->draw_pipeline_id != 0) {
        sg_pipeline draw_pipeline = { record->draw_pipeline_id };
        sg_destroy_pipeline(draw_pipeline);
    }
    if (record->indexed_pipeline_id != 0) {
        sg_pipeline indexed_pipeline = { record->indexed_pipeline_id };
        sg_destroy_pipeline(indexed_pipeline);
    }
    kg_remove_pipeline_record(pipeline_id);
}

void kg_destroy_default_resources(void) {
    if (kg_triangle_vertex_buffer.id != 0) {
        sg_destroy_buffer(kg_triangle_vertex_buffer);
        kg_triangle_vertex_buffer.id = 0;
    }
    if (kg_ui_demo_vertex_buffer.id != 0) {
        sg_destroy_buffer(kg_ui_demo_vertex_buffer);
        kg_ui_demo_vertex_buffer.id = 0;
    }
}
