#define SOKOL_IMPL
#define SOKOL_NO_ENTRY
#define SOKOL_GLCORE
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"

#include <stdio.h>
#include <stdlib.h>

static sg_buffer kg_triangle_vertex_buffer = {0};

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
    desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
    desc.attrs[0].glsl_name = "kira_attr_position";
    desc.label = label;
    return sg_make_shader(&desc).id;
}

uint32_t kg_make_pipeline(uint32_t shader_id, const char* label) {
    kg_ensure_triangle_vertex_buffer();

    sg_swapchain swapchain = sglue_swapchain();
    sg_pipeline_desc desc = {0};
    desc.shader.id = shader_id;
    desc.layout.attrs[0].format = SG_VERTEXFORMAT_FLOAT2;
    desc.layout.buffers[0].stride = sizeof(float) * 2;
    desc.color_count = 1;
    desc.colors[0].pixel_format = swapchain.color_format;
    desc.sample_count = swapchain.sample_count;
    desc.label = label;
    return sg_make_pipeline(&desc).id;
}

void kg_apply_pipeline_and_draw(uint32_t pipeline_id, int vertex_count, int instance_count) {
    kg_ensure_triangle_vertex_buffer();

    sg_pipeline pipeline = { pipeline_id };
    sg_bindings bindings = {0};
    bindings.vertex_buffers[0] = kg_triangle_vertex_buffer;
    sg_apply_pipeline(pipeline);
    sg_apply_bindings(&bindings);
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
}
