#define SOKOL_IMPL
#define SOKOL_NO_ENTRY
#define SOKOL_GLCORE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"

static sg_buffer kg_triangle_vertex_buffer = {0};
static sg_buffer kg_ui_demo_vertex_buffer = {0};
static uint32_t kg_ui_demo_pipeline_id = 0;

typedef struct {
    uint32_t id;
    bool has_position_attribute;
} kg_shader_record;

typedef struct {
    uint32_t id;
    bool has_position_attribute;
} kg_pipeline_record;

static kg_shader_record kg_shader_records[64];
static int kg_shader_record_count = 0;
static kg_pipeline_record kg_pipeline_records[64];
static int kg_pipeline_record_count = 0;

static void kg_record_shader(uint32_t id, bool has_position_attribute) {
    if (kg_shader_record_count >= 64) {
        return;
    }
    kg_shader_records[kg_shader_record_count].id = id;
    kg_shader_records[kg_shader_record_count].has_position_attribute = has_position_attribute;
    kg_shader_record_count += 1;
}

static bool kg_shader_has_position_attribute(uint32_t id) {
    for (int i = 0; i < kg_shader_record_count; i += 1) {
        if (kg_shader_records[i].id == id) {
            return kg_shader_records[i].has_position_attribute;
        }
    }
    return true;
}

static void kg_record_pipeline(uint32_t id, bool has_position_attribute) {
    if (kg_pipeline_record_count >= 64) {
        return;
    }
    kg_pipeline_records[kg_pipeline_record_count].id = id;
    kg_pipeline_records[kg_pipeline_record_count].has_position_attribute = has_position_attribute;
    kg_pipeline_record_count += 1;
}

static bool kg_pipeline_has_position_attribute(uint32_t id) {
    for (int i = 0; i < kg_pipeline_record_count; i += 1) {
        if (kg_pipeline_records[i].id == id) {
            return kg_pipeline_records[i].has_position_attribute;
        }
    }
    return true;
}

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
    fprintf(stderr, "Kira Graphics: %s[%u] %s:%u: %s: %s\n",
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

void kg_setup(void) {
    sg_desc desc = {0};
    desc.environment = sglue_environment();
    desc.logger.func = kg_sokol_log;
    sg_setup(&desc);
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

const char* kg_shader_source(const char* inline_source, const char* path) {
    if (path == NULL || path[0] == '\0') {
        return inline_source == NULL ? "" : inline_source;
    }

    FILE* file = fopen(path, "rb");
    if (file == NULL) {
        fprintf(stderr, "Kira Graphics: could not open shader source '%s'\n", path);
        return "";
    }

    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        fprintf(stderr, "Kira Graphics: could not seek shader source '%s'\n", path);
        return "";
    }

    long length = ftell(file);
    if (length < 0) {
        fclose(file);
        fprintf(stderr, "Kira Graphics: could not measure shader source '%s'\n", path);
        return "";
    }

    rewind(file);

    char* buffer = (char*)malloc((size_t)length + 1);
    if (buffer == NULL) {
        fclose(file);
        fprintf(stderr, "Kira Graphics: could not allocate shader source '%s'\n", path);
        return "";
    }

    size_t read_count = fread(buffer, 1, (size_t)length, file);
    fclose(file);
    buffer[read_count] = '\0';
    return buffer;
}

void kg_begin_swapchain_pass(float r, float g, float b, float a) {
    sg_pass pass = {0};
    pass.action.colors[0].load_action = SG_LOADACTION_CLEAR;
    pass.action.colors[0].store_action = SG_STOREACTION_STORE;
    pass.action.colors[0].clear_value = (sg_color){ r, g, b, a };
    pass.swapchain = sglue_swapchain();
    sg_begin_pass(&pass);
}

uint32_t kg_make_shader(const char* label, const char* vertex_source, const char* fragment_source, const char* vertex_path, const char* fragment_path) {
    sg_shader_desc desc = {0};
    desc.vertex_func.source = kg_shader_source(vertex_source, vertex_path);
    desc.fragment_func.source = kg_shader_source(fragment_source, fragment_path);
    bool has_position_attribute = strstr(desc.vertex_func.source, "kira_attr_position") != NULL;
    if (has_position_attribute) {
        desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        desc.attrs[0].glsl_name = "kira_attr_position";
    }
    desc.label = label;
    uint32_t shader_id = sg_make_shader(&desc).id;
    kg_record_shader(shader_id, has_position_attribute);
    return shader_id;
}

uint32_t kg_make_pipeline(uint32_t shader_id, const char* label) {
    bool has_position_attribute = kg_shader_has_position_attribute(shader_id);
    if (has_position_attribute) {
        kg_ensure_triangle_vertex_buffer();
    }

    sg_swapchain swapchain = sglue_swapchain();
    sg_pipeline_desc desc = {0};
    desc.shader.id = shader_id;
    if (has_position_attribute) {
        desc.layout.buffers[0].stride = sizeof(float) * 2;
        desc.layout.buffers[0].step_func = SG_VERTEXSTEP_PER_VERTEX;
        desc.layout.buffers[0].step_rate = 1;
        desc.layout.attrs[0].buffer_index = 0;
        desc.layout.attrs[0].offset = 0;
        desc.layout.attrs[0].format = SG_VERTEXFORMAT_FLOAT2;
    }
    desc.color_count = 1;
    desc.colors[0].pixel_format = swapchain.color_format;
    desc.sample_count = swapchain.sample_count;
    desc.label = label;
    uint32_t pipeline_id = sg_make_pipeline(&desc).id;
    if (label != NULL && strstr(label, "ui-demo") != NULL) {
        kg_ui_demo_pipeline_id = pipeline_id;
    }
    kg_record_pipeline(pipeline_id, has_position_attribute);
    return pipeline_id;
}

void kg_apply_pipeline_and_draw(uint32_t pipeline_id, int vertex_count, int instance_count) {
    sg_pipeline pipeline = { pipeline_id };
    sg_apply_pipeline(pipeline);
    if (kg_pipeline_has_position_attribute(pipeline_id)) {
        sg_bindings bindings = {0};
        if (pipeline_id == kg_ui_demo_pipeline_id) {
            kg_ensure_ui_demo_vertex_buffer();
            bindings.vertex_buffers[0] = kg_ui_demo_vertex_buffer;
        } else {
            kg_ensure_triangle_vertex_buffer();
            bindings.vertex_buffers[0] = kg_triangle_vertex_buffer;
        }
        sg_apply_bindings(&bindings);
    }
    sg_draw(0, vertex_count, instance_count);
}

void kg_destroy_shader_id(uint32_t shader_id) {
    sg_shader shader = { shader_id };
    sg_destroy_shader(shader);
}

void kg_destroy_pipeline_id(uint32_t pipeline_id) {
    sg_pipeline pipeline = { pipeline_id };
    sg_destroy_pipeline(pipeline);
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
