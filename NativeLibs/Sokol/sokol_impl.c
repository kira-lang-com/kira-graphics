#define SOKOL_IMPL
#include <stdbool.h>
#include <ctype.h>
#include <stdint.h>
#include <limits.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#if !defined(_WIN32)
#include <time.h>
#endif
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
#ifndef M_PI_2
#define M_PI_2 1.57079632679489661923
#endif
#ifndef M_SQRT2
#define M_SQRT2 1.41421356237309504880
#endif
#if defined(_WIN32)
#include <windows.h>
#elif defined(__APPLE__)
#include <mach-o/dyld.h>
#include <TargetConditionals.h>
#elif defined(__linux__)
#include <unistd.h>
#endif

#if defined(__EMSCRIPTEN__)
#ifndef SOKOL_WGPU
#define SOKOL_WGPU
#endif
#elif defined(__APPLE__)
#if TARGET_OS_IPHONE
#ifndef SOKOL_METAL
#define SOKOL_METAL
#endif
#else
#ifndef SOKOL_GLCORE
#define SOKOL_GLCORE
#endif
#endif
#elif defined(_WIN32)
#if !defined(SOKOL_GLCORE) && !defined(SOKOL_D3D11) && !defined(SOKOL_VULKAN)
#define SOKOL_GLCORE
#endif
#elif defined(__linux__)
#ifndef SOKOL_GLCORE
#define SOKOL_GLCORE
#endif
#endif

#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"

void kira_live_emit_first_frame(void);
void kira_live_emit_log_line(const char* line);

static uint64_t kg_monotonic_now_ns(void) {
#if defined(_WIN32)
    static LARGE_INTEGER frequency;
    static int frequency_initialized = 0;
    if (!frequency_initialized) {
        QueryPerformanceFrequency(&frequency);
        frequency_initialized = 1;
    }
    LARGE_INTEGER counter;
    QueryPerformanceCounter(&counter);
    return (uint64_t)((double)counter.QuadPart * 1000000000.0 / (double)frequency.QuadPart);
#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
#endif
}

void kg_sapp_log(const char* tag, uint32_t level, uint32_t item_id, const char* message, uint32_t line_nr, const char* filename, void* user_data) {
    (void)item_id;
    (void)user_data;
    fprintf(stderr, "%s[%u] %s:%u: %s\n",
        tag ? tag : "sapp",
        level,
        filename ? filename : "sokol_app.h",
        line_nr,
        message ? message : "Sokol app error");
}

#ifndef KG_PATH_BUFFER_SIZE
#define KG_PATH_BUFFER_SIZE 4096
#endif

// Per-uniform-block descriptor parsed from the KSL `uniformReflection` string
// (real shader-compiler reflection). Replaces the old hardcoded scene/object
// uniform model: each declared uniform block carries its std140 size, the WGSL
// @group(0) binding (which is also the app's public bind slot), the stages it is
// visible to, and its member layout for the GL backend. vertex_block_slot /
// fragment_block_slot record which Sokol uniform_blocks[] slots the block was
// configured into (or -1 when the block is not used in that stage).
#ifndef KG_MAX_UNIFORM_BLOCK_MEMBERS
#define KG_MAX_UNIFORM_BLOCK_MEMBERS 16
#endif
#ifndef KG_MAX_UNIFORM_BLOCKS
#define KG_MAX_UNIFORM_BLOCKS 8
#endif
typedef struct {
    char name[64];
    int binding;
    uint32_t size;
    uint32_t stage_mask; // bit0 vertex, bit1 fragment, bit2 compute
    int vertex_block_slot;
    int fragment_block_slot;
    int member_count;
    struct {
        char name[64];
        uint32_t offset;
        uint32_t size;
    } members[KG_MAX_UNIFORM_BLOCK_MEMBERS];
} kg_uniform_block_desc;

// How many of a shader's uniform blocks kg_shader_info/kg_pipeline_info report
// back to Kira, which now owns this reflection data on the GraphicsShader /
// RenderPipeline value itself rather than in a table keyed by id. Every KSL
// shader in this codebase declares at most two; four is double that with no
// lookup array behind it.
#ifndef KG_EXPOSED_UNIFORM_BLOCKS
#define KG_EXPOSED_UNIFORM_BLOCKS 4
#endif

// One uniform block's Sokol placement: which public bind slot it answers to,
// its std140 size, and which Sokol uniform_blocks[] slot(s) it landed in per
// stage (-1 when the block is not used in that stage).
typedef struct {
    int32_t binding;
    uint32_t size;
    int32_t vertex_block_slot;
    int32_t fragment_block_slot;
} kg_uniform_block_slot;

// Everything a shader's reflection produced, returned by value. Kira keeps
// this on the `GraphicsShader` it already threads through the program in
// place of the `kg_shader_records` table this replaced, so there is nothing
// left to look up by id.
typedef struct {
    uint32_t id;
    int32_t has_position_attribute;
    int32_t has_normal_attribute;
    uint32_t required_uniform_mask;
    uint32_t available_uniform_mask;
    int32_t uniform_desc_count;
    kg_uniform_block_slot blocks[KG_EXPOSED_UNIFORM_BLOCKS];
} kg_shader_info;

// Everything a pipeline creation produced: both the "draw" and "indexed"
// Sokol pipeline objects — Sokol pipelines are immutable about index type, so
// Kira draws through whichever one a given call needs — plus the shader
// metadata a draw validates and places its uniform uploads with. Kira keeps
// this on the `RenderPipeline` value in place of `kg_pipeline_records`.
typedef struct {
    uint32_t draw_pipeline_id;
    uint32_t indexed_pipeline_id;
    int32_t has_position_attribute;
    uint32_t required_uniform_mask;
    uint32_t available_uniform_mask;
    int32_t uniform_desc_count;
    kg_uniform_block_slot blocks[KG_EXPOSED_UNIFORM_BLOCKS];
} kg_pipeline_info;

typedef struct {
    const char* ptr;
    bool owned;
} kg_owned_text;

typedef struct {
    void* ptr;
    size_t size;
} kg_owned_bytes;

// The peak resource counts Kira has observed this run, sampled once per frame
// (`kiraGraphicsSokolFrame`) instead of after every create/destroy: a leak or
// a spike lasts at least one frame, so frame-granularity sampling catches it
// exactly as reliably as the old per-call `kg_update_lifetime_peaks` did,
// without a call at 47 separate sites. Kira owns the running max; this is
// only the shape it hands to `kg_report_lifetime` to print.
typedef struct {
    uint32_t buffers;
    uint32_t images;
    uint32_t samplers;
    uint32_t views;
    uint32_t shaders;
    uint32_t pipelines;
} kg_lifetime_peaks;

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

static bool kg_lifetime_report_enabled(void) {
    const char* value = getenv("KIRA_GRAPHICS_LIFETIME_REPORT");
    return value != NULL && value[0] != '\0' && value[0] != '0';
}

static bool kg_lifetime_detail_enabled(void) {
    const char* value = getenv("KIRA_GRAPHICS_LIFETIME_DETAIL");
    return value != NULL && value[0] != '\0' && value[0] != '0';
}

// The Sokol-tracked resources still alive, for the lifetime stress self-check.
// Shaders, pipelines, uniforms and bind groups are no longer C-side records —
// uniforms and bind groups never were real GPU resources, and shaders/pipelines
// now live only as fields on the Kira values that hold them — so this counts
// exactly what `sg_query_stats` itself tracks.
static int kg_lifetime_outstanding_count(void) {
    int total = 0;
    if (sg_isvalid()) {
        sg_stats stats = sg_query_stats();
        total += (int)stats.total.buffers.alive;
        total += (int)stats.total.images.alive;
        total += (int)stats.total.samplers.alive;
        total += (int)stats.total.views.alive;
        total += (int)stats.total.shaders.alive;
        total += (int)stats.total.pipelines.alive;
    }
    return total;
}

// Seconds on a monotonic clock. The one thing a CPU-time measurement needs and
// the one thing Kira has no way to spell: there is no clock in the language or
// in Foundation, and reading one is a platform call.
double kg_monotonic_seconds(void) {
    return (double)kg_monotonic_now_ns() / 1000000000.0;
}

// --- GPU frame time -------------------------------------------------------
// Two `GL_TIMESTAMP` counters per frame, read a frame late.
//
// Not a `GL_TIME_ELAPSED` query bracketing the frame's commands, which is the
// obvious way to write this and was measured at 13 ms a frame on this driver —
// 30 FPS down to 22 in the liquid-glass app, for a readout. A query that
// ENCLOSES a sequence of passes makes the driver keep them together;
// `glQueryCounter` only asks the GPU to write the clock where the command
// stream reaches it, and costs nothing measurable.
//
// sokol_gfx has no timing API and does not load the query entry points, so they
// are resolved here; on every platform but Windows they are ordinary linked
// symbols, because only Windows makes an application load GL past 1.1 itself.
//
// Two pairs, used alternately: a counter's value is not available in the frame
// that issued it without stalling for it, so each frame reads the pair issued in
// the frame before. That is a frame of latency in a readout, not in the picture.

#ifndef GL_TIMESTAMP
#define GL_TIMESTAMP 0x8E28
#endif
#ifndef GL_QUERY_RESULT
#define GL_QUERY_RESULT 0x8866
#endif
#ifndef GL_QUERY_RESULT_AVAILABLE
#define GL_QUERY_RESULT_AVAILABLE 0x8867
#endif

#if defined(SOKOL_GLCORE)

typedef void (GL_APIENTRY *KG_PFN_GEN_QUERIES)(GLsizei, GLuint*);
typedef void (GL_APIENTRY *KG_PFN_QUERY_COUNTER)(GLuint, GLenum);
typedef void (GL_APIENTRY *KG_PFN_GET_QUERY_OBJECT_UIV)(GLuint, GLenum, GLuint*);
typedef void (GL_APIENTRY *KG_PFN_GET_QUERY_OBJECT_UI64V)(GLuint, GLenum, uint64_t*);

static KG_PFN_GEN_QUERIES kg_glGenQueries;
static KG_PFN_QUERY_COUNTER kg_glQueryCounter;
static KG_PFN_GET_QUERY_OBJECT_UIV kg_glGetQueryObjectuiv;
static KG_PFN_GET_QUERY_OBJECT_UI64V kg_glGetQueryObjectui64v;

static int kg_gpu_timer_state = 0; // 0 untried, 1 ready, -1 unavailable
// [frame slot][0 = frame start, 1 = frame end]
static GLuint kg_gpu_queries[2][2];
static int kg_gpu_query_slot = 0;
static int kg_gpu_query_pending[2];
static double kg_gpu_frame_seconds_value = 0.0;
static int kg_gpu_timer_open = 0;

#if defined(_WIN32)
static void* kg_gl_proc(const char* name) {
    HMODULE gl = GetModuleHandleA("opengl32.dll");
    if (gl == NULL) {
        return NULL;
    }
    typedef PROC (WINAPI *KG_PFN_WGL_GET_PROC)(LPCSTR);
    KG_PFN_WGL_GET_PROC wgl = (KG_PFN_WGL_GET_PROC)GetProcAddress(gl, "wglGetProcAddress");
    void* addr = wgl != NULL ? (void*)wgl(name) : NULL;
    if (addr == NULL) {
        addr = (void*)GetProcAddress(gl, name);
    }
    return addr;
}
#endif

static bool kg_gpu_timer_ready(void) {
    if (kg_gpu_timer_state != 0) {
        return kg_gpu_timer_state > 0;
    }
    kg_gpu_timer_state = -1;
    // On unless a run turns it off. A timer query is a synchronization point,
    // so it earned a measurement of its own: 400 frames of the liquid-glass app
    // with and without, twice each, came out 66.3/64.8 s against 68.2/64.7 s —
    // no difference outside the run-to-run spread. `KIRA_GRAPHICS_GPU_TIME=0`
    // is for a run that must not issue one regardless; the HUD then says `not
    // measured` rather than `0.0 ms`.
    const char* wanted = getenv("KIRA_GRAPHICS_GPU_TIME");
    if (wanted != NULL && wanted[0] == '0' && wanted[1] == '\0') {
        return false;
    }
#if defined(_WIN32)
    kg_glGenQueries = (KG_PFN_GEN_QUERIES)kg_gl_proc("glGenQueries");
    kg_glQueryCounter = (KG_PFN_QUERY_COUNTER)kg_gl_proc("glQueryCounter");
    kg_glGetQueryObjectuiv = (KG_PFN_GET_QUERY_OBJECT_UIV)kg_gl_proc("glGetQueryObjectuiv");
    kg_glGetQueryObjectui64v = (KG_PFN_GET_QUERY_OBJECT_UI64V)kg_gl_proc("glGetQueryObjectui64v");
#else
    kg_glGenQueries = (KG_PFN_GEN_QUERIES)glGenQueries;
    kg_glQueryCounter = (KG_PFN_QUERY_COUNTER)glQueryCounter;
    kg_glGetQueryObjectuiv = (KG_PFN_GET_QUERY_OBJECT_UIV)glGetQueryObjectuiv;
    kg_glGetQueryObjectui64v = (KG_PFN_GET_QUERY_OBJECT_UI64V)glGetQueryObjectui64v;
#endif
    if (kg_glGenQueries == NULL || kg_glQueryCounter == NULL ||
        kg_glGetQueryObjectuiv == NULL || kg_glGetQueryObjectui64v == NULL) {
        return false;
    }
    kg_glGenQueries(4, &kg_gpu_queries[0][0]);
    if (kg_gpu_queries[0][0] == 0 || kg_gpu_queries[1][1] == 0) {
        return false;
    }
    kg_gpu_query_pending[0] = 0;
    kg_gpu_query_pending[1] = 0;
    kg_gpu_timer_state = 1;
    return true;
}

void kg_gpu_timer_begin(void) {
    if (!kg_gpu_timer_ready() || kg_gpu_timer_open) {
        return;
    }
    kg_glQueryCounter(kg_gpu_queries[kg_gpu_query_slot][0], GL_TIMESTAMP);
    kg_gpu_timer_open = 1;
}

void kg_gpu_timer_end(void) {
    if (!kg_gpu_timer_ready() || !kg_gpu_timer_open) {
        return;
    }
    kg_glQueryCounter(kg_gpu_queries[kg_gpu_query_slot][1], GL_TIMESTAMP);
    kg_gpu_timer_open = 0;
    kg_gpu_query_pending[kg_gpu_query_slot] = 1;
    // Read the OTHER pair, issued a frame ago and long since retired.
    const int other = kg_gpu_query_slot ^ 1;
    if (kg_gpu_query_pending[other]) {
        GLuint available = 0;
        kg_glGetQueryObjectuiv(kg_gpu_queries[other][1], GL_QUERY_RESULT_AVAILABLE, &available);
        if (available != 0) {
            uint64_t began = 0;
            uint64_t ended = 0;
            kg_glGetQueryObjectui64v(kg_gpu_queries[other][0], GL_QUERY_RESULT, &began);
            kg_glGetQueryObjectui64v(kg_gpu_queries[other][1], GL_QUERY_RESULT, &ended);
            if (ended > began) {
                kg_gpu_frame_seconds_value = (double)(ended - began) / 1000000000.0;
            }
            kg_gpu_query_pending[other] = 0;
        }
    }
    kg_gpu_query_slot = other;
}

double kg_gpu_frame_seconds(void) {
    return kg_gpu_frame_seconds_value;
}

#else

// A non-GL sokol build (D3D11, Metal) has its own timing surface and none of
// this applies. Answering zero here would be the reading a HUD must not show,
// so `kg_gpu_timer_supported` is what a caller asks first.
void kg_gpu_timer_begin(void) {}
void kg_gpu_timer_end(void) {}
double kg_gpu_frame_seconds(void) { return 0.0; }

#endif

bool kg_gpu_timer_supported(void) {
#if defined(SOKOL_GLCORE)
    return kg_gpu_timer_ready();
#else
    return false;
#endif
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
    // Codes match app/Public/Constants.kira: vertexFormatFloat()=0,
    // vertexFormatFloat2()=1, vertexFormatFloat3()=2, vertexFormatFloat4()=3.
    switch (format) {
        case 0:
            return SG_VERTEXFORMAT_FLOAT;
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

static bool kg_validate_pipeline_layout(
    bool shader_has_position_attribute,
    bool shader_has_normal_attribute,
    int64_t vertex_stride,
    int64_t attribute_count,
    int64_t attr0_format,
    int64_t attr0_offset,
    int64_t attr1_format,
    int64_t attr1_offset
) {
    if (shader_has_position_attribute && attribute_count < 1) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: shader requires a position attribute but the descriptor has no vertex attributes.\n");
        return false;
    }

    if (!shader_has_normal_attribute) {
        return true;
    }

    if (attribute_count < 2) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: shader requires a normal attribute but the descriptor has fewer than two vertex attributes.\n");
        return false;
    }
    if (vertex_stride != 24) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: normal-mapped 3D shader expects vertex stride 24, got %lld.\n", (long long)vertex_stride);
        return false;
    }
    if (attr0_format != 2) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: position attribute format must be float3, got %lld.\n", (long long)attr0_format);
        return false;
    }
    if (attr0_offset != 0) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: position attribute offset must be 0, got %lld.\n", (long long)attr0_offset);
        return false;
    }
    if (attr1_format != 2) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: normal attribute format must be float3, got %lld.\n", (long long)attr1_format);
        return false;
    }
    if (attr1_offset != 12) {
        fprintf(stderr, "KiraGraphics pipeline validation failed: normal attribute offset must be 12, got %lld.\n", (long long)attr1_offset);
        return false;
    }
    return true;
}

static sg_filter kg_filter(int64_t filter) {
    return filter == 2 ? SG_FILTER_LINEAR : SG_FILTER_NEAREST;
}

static sg_wrap kg_wrap(int64_t address_mode) {
    return address_mode == 1 ? SG_WRAP_CLAMP_TO_EDGE : SG_WRAP_REPEAT;
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

static char* kg_join_shader_entry(const char* asset, const char* stage) {
    const char* safe_asset = (asset == NULL) ? "" : asset;
    const char* safe_stage = (stage == NULL) ? "" : stage;
    const size_t asset_length = strlen(safe_asset);
    const size_t stage_length = strlen(safe_stage);
    const char* suffix = "__main";
    const size_t total = asset_length + 2 + stage_length + strlen(suffix) + 1;
    char* entry = (char*)malloc(total);
    if (entry == NULL) {
        return NULL;
    }
    entry[0] = '\0';
    strcat(entry, safe_asset);
    strcat(entry, "__");
    strcat(entry, safe_stage);
    strcat(entry, suffix);
    return entry;
}

static void kg_owned_text_deinit(kg_owned_text* text) {
    if (text == NULL) {
        return;
    }
    if (text->owned) {
        free((void*)text->ptr);
    }
    text->ptr = NULL;
    text->owned = false;
}

static kg_owned_text kg_replace_shader_text(kg_owned_text source, const char* needle, const char* replacement) {
    if (source.ptr == NULL || needle == NULL || replacement == NULL) {
        return source;
    }
    const char* found = strstr(source.ptr, needle);
    if (found == NULL) {
        return source;
    }

    const size_t prefix_len = (size_t)(found - source.ptr);
    const size_t needle_len = strlen(needle);
    const size_t replacement_len = strlen(replacement);
    const size_t suffix_len = strlen(found + needle_len);
    char* result = (char*)malloc(prefix_len + replacement_len + suffix_len + 1);
    if (result == NULL) {
        return source;
    }

    memcpy(result, source.ptr, prefix_len);
    memcpy(result + prefix_len, replacement, replacement_len);
    memcpy(result + prefix_len + replacement_len, found + needle_len, suffix_len + 1);
    kg_owned_text_deinit(&source);
    return (kg_owned_text){ result, true };
}

static kg_owned_text kg_prepare_shader_source_for_sokol(kg_owned_text source) {
    kg_owned_text prepared = source;
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

// The colour target the lifetime stress loop renders into.
//
// Built here rather than through a texture entry point, because there is no
// longer a texture entry point in this file: Kira owns image and view creation
// now, and this loop is C exercising sokol's own allocator churn.
static sg_image kg_stress_make_color_image(int width, int height) {
    sg_image_desc desc = {0};
    desc.type = SG_IMAGETYPE_2D;
    desc.usage.color_attachment = true;
    desc.width = width;
    desc.height = height;
    desc.num_slices = 1;
    desc.num_mipmaps = 1;
    desc.pixel_format = SG_PIXELFORMAT_RGBA8;
    desc.sample_count = 1;
    desc.label = "lifetime-stress-color";
    sg_image image = sg_make_image(&desc);
    return image;
}

// The vertex and index buffers the lifetime stress loop churns. Here for the
// same reason the colour target is: buffer creation is Kira's now, and this
// loop is C exercising sokol's allocator with nothing Kira-side in the way.
static uint32_t kg_stress_make_buffer(const char* label, bool index_buffer, const void* values, size_t size) {
    sg_buffer_desc desc = {0};
    desc.label = label;
    desc.usage.immutable = true;
    desc.usage.vertex_buffer = !index_buffer;
    desc.usage.index_buffer = index_buffer;
    desc.size = size;
    desc.data.ptr = values;
    desc.data.size = size;
    return sg_make_buffer(&desc).id;
}

static uint32_t kg_stress_make_color_view(sg_image image) {
    if (image.id == 0) {
        return 0;
    }
    sg_view_desc desc = {0};
    desc.color_attachment.image = image;
    desc.label = "lifetime-stress-color";
    uint32_t view_id = sg_make_view(&desc).id;
    if (view_id == 0) {
        sg_destroy_image(image);
    }
    return view_id;
}

static void kg_stress_destroy_color(sg_image image, uint32_t view_id) {
    if (view_id != 0) {
        sg_view view = { view_id };
        sg_destroy_view(view);
    }
    if (image.id != 0) {
        sg_destroy_image(image);
    }
}

static kg_owned_text kg_shader_source_owned(const char* inline_source, const char* path) {
    if (path == NULL || path[0] == '\0') {
        return (kg_owned_text){ inline_source == NULL ? "" : inline_source, false };
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
        return (kg_owned_text){ "", false };
    }

    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        printf("Kira Graphics: could not seek shader source '%s'\n", opened_path);
        free(fallback_path);
        return (kg_owned_text){ "", false };
    }

    long length = ftell(file);
    if (length < 0) {
        fclose(file);
        printf("Kira Graphics: could not measure shader source '%s'\n", opened_path);
        free(fallback_path);
        return (kg_owned_text){ "", false };
    }

    rewind(file);

    char* buffer = (char*)malloc((size_t)length + 1);
    if (buffer == NULL) {
        fclose(file);
        printf("Kira Graphics: could not allocate shader source '%s'\n", opened_path);
        free(fallback_path);
        return (kg_owned_text){ "", false };
    }

    size_t read_count = fread(buffer, 1, (size_t)length, file);
    fclose(file);
    buffer[read_count] = '\0';
    free(fallback_path);
    return (kg_owned_text){ buffer, true };
}

#if defined(__EMSCRIPTEN__)
#include <emscripten/em_js.h>
// Kira owns the right mouse button (Unreal-style viewport look, context actions).
// Without this the browser's native context menu opens on RMB and, worse, steals
// the corresponding mouseup: the app never sees the release, so RMB-held state
// (and a hidden cursor) can wedge permanently. Suppress the menu on the canvas
// and, as a safety net, restore the CSS cursor whenever every button is released
// or the page loses focus/visibility while sokol has it hidden — the app's own
// show-mouse call remains the source of truth on the next real transition.
EM_JS(void, kg_js_own_right_click, (void), {
    const target = Module.sapp_emsc_target || Module.canvas;
    if (!target || target.__kira_rmb_owned) return;
    target.__kira_rmb_owned = true;
    const stopMenu = (e) => { e.preventDefault(); return false; };
    target.addEventListener('contextmenu', stopMenu);
    window.addEventListener('contextmenu', (e) => {
        if (e.target === target) { e.preventDefault(); }
    });
    const restoreCursor = () => {
        if (target.style.cursor === 'none') { target.style.cursor = 'auto'; }
    };
    // All-buttons-released anywhere (incl. outside the canvas) and page
    // blur/hidden are the states where a hidden cursor can no longer be
    // intentional; un-hide so the UI stays usable.
    window.addEventListener('mouseup', (e) => { if (e.buttons === 0) restoreCursor(); });
    window.addEventListener('blur', restoreCursor);
    document.addEventListener('visibilitychange', () => {
        if (document.visibilityState !== 'visible') restoreCursor();
    });
});
#endif

void kg_setup(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    sg_desc desc = {0};
    desc.environment = sglue_environment();
    desc.logger.func = kg_sokol_log;
    sg_setup(&desc);
#if defined(__EMSCRIPTEN__)
    kg_js_own_right_click();
#endif
}

void kg_destroy_buffer_id(uint32_t buffer_id) {
    if (buffer_id == 0) {
        return;
    }
    sg_buffer buffer = { buffer_id };
    sg_destroy_buffer(buffer);
}

uint32_t kg_create_sampler_id(const char* label, int64_t min_filter, int64_t mag_filter, int64_t address_mode_u, int64_t address_mode_v) {
    sg_sampler_desc desc = {0};
    desc.min_filter = kg_filter(min_filter);
    desc.mag_filter = kg_filter(mag_filter);
    desc.mipmap_filter = kg_filter(min_filter);
    desc.wrap_u = kg_wrap(address_mode_u);
    desc.wrap_v = kg_wrap(address_mode_v);
    desc.label = label;
    sg_sampler sampler = sg_make_sampler(&desc);
    return sampler.id;
}

void kg_destroy_sampler_id(uint32_t sampler_id) {
    if (sampler_id != 0) {
        sg_sampler sampler = { sampler_id };
        sg_destroy_sampler(sampler);
    }
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

// --- Data-driven bindings (real KSL shader reflection) ---------------------
// The `ksl!` macro emits a compact `resourceReflection` string - one record per
// resource, records separated by `;`, each opening with a letter naming its
// kind (see `resource_digest` in kira-shader-ir). When present it fully
// describes what a shader binds, so the Sokol backend no longer greps source
// for hardcoded "scene"/"object" names or for the two `kira_texN_smpN` pairs it
// used to be limited to. Shaders without a reflection string (the file-based
// KSL path, SPIR-V metadata) fall back to the legacy scene/object configuration
// below, preserving existing behavior.

static uint32_t kg_parse_reflection_uint(const char** cursor) {
    const char* s = *cursor;
    uint32_t value = 0;
    while (*s >= '0' && *s <= '9') {
        value = value * 10u + (uint32_t)(*s - '0');
        s += 1;
    }
    *cursor = s;
    return value;
}

// One texture, sampler or storage buffer as the reflection describes it.
typedef struct {
    char name[64];
    char glsl_name[64];
    int binding;
    uint32_t stage_mask; // bit0 vertex, bit1 fragment, bit2 compute
    int paired_binding;  // a texture's sampler slot, 255 when nothing samples it
    int glsl_binding;    // a storage buffer's std430 `binding = n`
    int readonly;
} kg_binding_desc;

// Everything one shader's reflection string described.
typedef struct {
    kg_uniform_block_desc uniforms[KG_MAX_UNIFORM_BLOCKS];
    int uniform_count;
    kg_binding_desc textures[SG_MAX_VIEW_BINDSLOTS];
    int texture_count;
    kg_binding_desc samplers[SG_MAX_SAMPLER_BINDSLOTS];
    int sampler_count;
    kg_binding_desc storages[SG_MAX_VIEW_BINDSLOTS];
    int storage_count;
} kg_reflected_bindings;

// The Sokol shader stage a record's stage mask names.
//
// One stage, not a set: `sg_shader_view` and `sg_shader_sampler` each carry a
// single stage, so a resource read in two stages would need two bind slots. The
// vertex stage wins because a resource read there is the one that has to arrive
// earliest, and on GL - the backend this configuration is for - a texture unit
// and a storage-buffer binding point are program-wide state, so one declaration
// already serves both stages.
static sg_shader_stage kg_stage_from_mask(uint32_t stage_mask) {
    if ((stage_mask & 4u) != 0u) {
        return SG_SHADERSTAGE_COMPUTE;
    }
    if ((stage_mask & 1u) != 0u) {
        return SG_SHADERSTAGE_VERTEX;
    }
    if ((stage_mask & 2u) != 0u) {
        return SG_SHADERSTAGE_FRAGMENT;
    }
    // No stage reads it. SG_SHADERSTAGE_NONE is how a shader desc says a bind
    // slot is not there at all, which is what an unread resource is: the
    // emitted source does not declare it (see `Emitter::resources` in
    // kira-glsl-backend), so binding it would ask the GL driver for a uniform
    // location the linked program has not got.
    return SG_SHADERSTAGE_NONE;
}

// Copies the characters up to `stop` (or the record's end) into `out`.
static void kg_parse_reflection_name(const char** cursor, char stop, char* out, size_t capacity) {
    const char* s = *cursor;
    size_t n = 0;
    while (*s != '\0' && *s != stop && *s != ';' && n + 1 < capacity) {
        out[n++] = *s++;
    }
    out[n] = '\0';
    while (*s != '\0' && *s != stop && *s != ';') {
        s++;
    }
    *cursor = s;
}

// Advances past the current record's terminating `;`.
static const char* kg_skip_reflection_record(const char* s) {
    while (*s != '\0' && *s != ';') {
        s++;
    }
    if (*s == ';') {
        s++;
    }
    return s;
}

// Parses one `u|...` record's members: `name@offset#size`, comma separated.
static void kg_parse_reflection_members(const char** cursor, kg_uniform_block_desc* d, uint32_t member_count) {
    const char* s = *cursor;
    for (uint32_t m = 0; m < member_count; m++) {
        if (d->member_count < KG_MAX_UNIFORM_BLOCK_MEMBERS) {
            int mn = 0;
            while (*s != '\0' && *s != '@' && mn < (int)sizeof(d->members[0].name) - 1) {
                d->members[d->member_count].name[mn++] = *s++;
            }
            d->members[d->member_count].name[mn] = '\0';
            while (*s != '\0' && *s != '@') s++;
            if (*s == '@') { s++; d->members[d->member_count].offset = kg_parse_reflection_uint(&s); }
            if (*s == '#') { s++; d->members[d->member_count].size = kg_parse_reflection_uint(&s); }
            d->member_count++;
        } else {
            while (*s != '\0' && *s != ',' && *s != ';') s++;
        }
        if (*s == ',') { s++; continue; }
        break;
    }
    *cursor = s;
}

// Parses the whole reflection string into `out`. Returns whether anything was
// described: an empty result is what selects the legacy source-grep path.
static bool kg_parse_resource_reflection(const char* text, kg_reflected_bindings* out) {
    memset(out, 0, sizeof(*out));
    if (text == NULL || text[0] == '\0') {
        return false;
    }
    const char* s = text;
    while (*s != '\0') {
        const char kind = s[0];
        if (s[1] != '|') {
            // Not a record this format writes; skip it rather than reading its
            // fields as another kind's.
            s = kg_skip_reflection_record(s);
            continue;
        }
        s += 2;
        if (kind == 'u') {
            if (out->uniform_count >= KG_MAX_UNIFORM_BLOCKS) {
                s = kg_skip_reflection_record(s);
                continue;
            }
            kg_uniform_block_desc* d = &out->uniforms[out->uniform_count];
            memset(d, 0, sizeof(*d));
            d->vertex_block_slot = -1;
            d->fragment_block_slot = -1;
            kg_parse_reflection_name(&s, ':', d->name, sizeof(d->name));
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; d->binding = (int)kg_parse_reflection_uint(&s);
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; d->size = kg_parse_reflection_uint(&s);
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; d->stage_mask = kg_parse_reflection_uint(&s);
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; uint32_t member_count = kg_parse_reflection_uint(&s);
            if (member_count > 0 && *s == ':') {
                s++;
                kg_parse_reflection_members(&s, d, member_count);
            }
            out->uniform_count += 1;
        } else if (kind == 't' || kind == 'm' || kind == 's') {
            kg_binding_desc entry;
            memset(&entry, 0, sizeof(entry));
            entry.paired_binding = 255;
            kg_parse_reflection_name(&s, ':', entry.name, sizeof(entry.name));
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; entry.binding = (int)kg_parse_reflection_uint(&s);
            if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
            s++; entry.stage_mask = kg_parse_reflection_uint(&s);
            if (kind == 't') {
                if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
                s++; entry.paired_binding = (int)kg_parse_reflection_uint(&s);
                if (*s == ':') { s++; }
                kg_parse_reflection_name(&s, ';', entry.glsl_name, sizeof(entry.glsl_name));
                if (out->texture_count < (int)SG_MAX_VIEW_BINDSLOTS) {
                    out->textures[out->texture_count++] = entry;
                }
            } else if (kind == 's') {
                if (*s != ':') { s = kg_skip_reflection_record(s); continue; }
                s++; entry.glsl_binding = (int)kg_parse_reflection_uint(&s);
                if (*s == ':') { s++; entry.readonly = (int)kg_parse_reflection_uint(&s); }
                if (out->storage_count < (int)SG_MAX_VIEW_BINDSLOTS) {
                    out->storages[out->storage_count++] = entry;
                }
            } else {
                if (out->sampler_count < (int)SG_MAX_SAMPLER_BINDSLOTS) {
                    out->samplers[out->sampler_count++] = entry;
                }
            }
        }
        s = kg_skip_reflection_record(s);
    }
    return out->uniform_count > 0 || out->texture_count > 0 || out->sampler_count > 0 || out->storage_count > 0;
}

// Maps a std140 member byte size to a Sokol GL uniform type (KSL uniform members
// are float scalars/vectors/matrices). Only used by the GL backend; WGSL/Metal
// treat the block as opaque bytes.
static sg_uniform_type kg_uniform_type_from_size(uint32_t size, uint16_t* array_count) {
    *array_count = 1;
    switch (size) {
        case 4:  return SG_UNIFORMTYPE_FLOAT;
        case 8:  return SG_UNIFORMTYPE_FLOAT2;
        case 12: return SG_UNIFORMTYPE_FLOAT3;
        case 16: return SG_UNIFORMTYPE_FLOAT4;
        case 64: return SG_UNIFORMTYPE_MAT4;
        default:
            if (size >= 16 && (size % 16u) == 0u) {
                *array_count = (uint16_t)(size / 16u);
                return SG_UNIFORMTYPE_FLOAT4;
            }
            return SG_UNIFORMTYPE_FLOAT4;
    }
}

// Configures Sokol uniform blocks from parsed descriptors. Each descriptor is
// realized as one Sokol uniform block per stage it is visible to; the block's
// WGSL/MSL/HLSL/SPIR-V binding numbers all use the descriptor's binding (which is
// the WGSL @group(0) binding and the app's public bind slot). Records which Sokol
// block slot each stage landed in and returns the available-block bit mask.
// `member_name_storage` must remain live until sg_make_shader() consumes the desc.
static uint32_t kg_configure_uniform_blocks_from_descs(
    sg_shader_desc* desc,
    kg_uniform_block_desc* descs,
    int count,
    char (*member_name_storage)[80],
    int member_name_capacity
) {
    uint32_t available_mask = 0;
    int next_slot = 0;
    int name_index = 0;
    for (int i = 0; i < count; i += 1) {
        kg_uniform_block_desc* d = &descs[i];
        d->vertex_block_slot = -1;
        d->fragment_block_slot = -1;
        for (int stage_bit = 0; stage_bit < 2; stage_bit += 1) {
            if ((d->stage_mask & (1u << (uint32_t)stage_bit)) == 0) {
                continue;
            }
            if (next_slot >= KG_MAX_UNIFORM_BLOCKS) {
                break;
            }
            int slot = next_slot;
            next_slot += 1;
            sg_shader_uniform_block* block = &desc->uniform_blocks[slot];
            block->stage = (stage_bit == 0) ? SG_SHADERSTAGE_VERTEX : SG_SHADERSTAGE_FRAGMENT;
            block->size = d->size;
            block->layout = SG_UNIFORMLAYOUT_STD140;
            block->wgsl_group0_binding_n = (uint8_t)d->binding;
            block->msl_buffer_n = (uint8_t)d->binding;
            block->hlsl_register_b_n = (uint8_t)d->binding;
            block->spirv_set0_binding_n = (uint8_t)d->binding;
            for (int m = 0; m < d->member_count && m < SG_MAX_UNIFORMBLOCK_MEMBERS; m += 1) {
                uint16_t array_count = 1;
                sg_uniform_type type = kg_uniform_type_from_size(d->members[m].size, &array_count);
                block->glsl_uniforms[m].type = type;
                block->glsl_uniforms[m].array_count = array_count;
                if (name_index < member_name_capacity) {
                    char* store = member_name_storage[name_index];
                    name_index += 1;
                    snprintf(store, 80, "%s.%s", d->name, d->members[m].name);
                    block->glsl_uniforms[m].glsl_name = store;
                }
            }
            if (stage_bit == 0) {
                d->vertex_block_slot = slot;
            } else {
                d->fragment_block_slot = slot;
            }
            available_mask |= 1u << (uint32_t)slot;
        }
    }
    return available_mask;
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

// The two fixed texture/sampler pairs a shader with no reflection may use.
//
// Only the file-based KSL path and hand-written sources reach this: `kira_texN_smpN`
// is the name that path emits, and there has never been a third pair. A shader
// compiled through `ksl!` carries a reflection and is configured from it.
static void kg_configure_legacy_sampled_textures(sg_shader_desc* desc, const char* fragment_source) {
    const char* names[2] = { "kira_tex0_smp0", "kira_tex1_smp1" };
    const char* hlsl_names[2] = { "tex0.Sample(smp0", "tex1.Sample(smp1" };
    for (int slot = 0; slot < 2; slot += 1) {
        if (fragment_source == NULL ||
            (strstr(fragment_source, names[slot]) == NULL && strstr(fragment_source, hlsl_names[slot]) == NULL)) {
            continue;
        }
        desc->views[slot].texture.stage = SG_SHADERSTAGE_FRAGMENT;
        desc->views[slot].texture.image_type = SG_IMAGETYPE_2D;
        desc->views[slot].texture.sample_type = SG_IMAGESAMPLETYPE_FLOAT;
        desc->views[slot].texture.hlsl_register_t_n = (uint8_t)slot;
        desc->views[slot].texture.spirv_set1_binding_n = (uint8_t)slot;
        desc->samplers[slot].stage = SG_SHADERSTAGE_FRAGMENT;
        desc->samplers[slot].sampler_type = SG_SAMPLERTYPE_FILTERING;
        desc->samplers[slot].hlsl_register_s_n = (uint8_t)slot;
        desc->samplers[slot].spirv_set1_binding_n = (uint8_t)(slot + 2);
        desc->texture_sampler_pairs[slot].stage = SG_SHADERSTAGE_FRAGMENT;
        desc->texture_sampler_pairs[slot].view_slot = (uint8_t)slot;
        desc->texture_sampler_pairs[slot].sampler_slot = (uint8_t)slot;
        desc->texture_sampler_pairs[slot].glsl_name = names[slot];
    }
}

// Configures the textures, samplers and storage buffers the reflection
// described.
//
// Every bind slot is the resource's **public** slot — the WGSL binding within
// its group, which is also the number an application passes to
// `bindGroupAddTexture` and friends. Nothing here renumbers, so a slot in a
// `.ksl` group declaration, a slot in a bind-group call and a slot in
// `sg_bindings` are all the same number, and a mismatch is a shader edit rather
// than a table drifting out of step.
//
// The texture/sampler pair is what GL needs and no other backend has: a
// `sampler2D` uniform whose name comes from the texture, set to the texture unit
// the pair's view slot binds. Which sampler belongs to which texture is measured
// from the shader's own `sample` calls, so declaration adjacency is not assumed.
static void kg_configure_reflected_bindings(sg_shader_desc* desc, const kg_reflected_bindings* found) {
    for (int i = 0; i < found->texture_count; i += 1) {
        const kg_binding_desc* entry = &found->textures[i];
        const int slot = entry->binding;
        if (slot < 0 || slot >= (int)SG_MAX_VIEW_BINDSLOTS) {
            continue;
        }
        if (entry->stage_mask == 0u) {
            continue;
        }
        desc->views[slot].texture.stage = kg_stage_from_mask(entry->stage_mask);
        desc->views[slot].texture.image_type = SG_IMAGETYPE_2D;
        desc->views[slot].texture.sample_type = SG_IMAGESAMPLETYPE_FLOAT;
        desc->views[slot].texture.hlsl_register_t_n = (uint8_t)slot;
        desc->views[slot].texture.spirv_set1_binding_n = (uint8_t)slot;
        desc->views[slot].texture.wgsl_group1_binding_n = (uint8_t)slot;
        desc->views[slot].texture.msl_texture_n = (uint8_t)slot;
    }
    for (int i = 0; i < found->sampler_count; i += 1) {
        const kg_binding_desc* entry = &found->samplers[i];
        const int slot = entry->binding;
        if (slot < 0 || slot >= (int)SG_MAX_SAMPLER_BINDSLOTS) {
            continue;
        }
        if (entry->stage_mask == 0u) {
            continue;
        }
        desc->samplers[slot].stage = kg_stage_from_mask(entry->stage_mask);
        desc->samplers[slot].sampler_type = SG_SAMPLERTYPE_FILTERING;
        desc->samplers[slot].hlsl_register_s_n = (uint8_t)slot;
        desc->samplers[slot].spirv_set1_binding_n = (uint8_t)slot;
        desc->samplers[slot].wgsl_group1_binding_n = (uint8_t)slot;
        desc->samplers[slot].msl_sampler_n = (uint8_t)slot;
    }
    int pair = 0;
    for (int i = 0; i < found->texture_count; i += 1) {
        const kg_binding_desc* entry = &found->textures[i];
        if (entry->paired_binding < 0 || entry->paired_binding >= (int)SG_MAX_SAMPLER_BINDSLOTS) {
            continue;
        }
        if (entry->stage_mask == 0u) {
            continue;
        }
        if (entry->binding < 0 || entry->binding >= (int)SG_MAX_VIEW_BINDSLOTS) {
            continue;
        }
        if (pair >= (int)SG_MAX_TEXTURE_SAMPLER_PAIRS) {
            break;
        }
        desc->texture_sampler_pairs[pair].stage = kg_stage_from_mask(entry->stage_mask);
        desc->texture_sampler_pairs[pair].view_slot = (uint8_t)entry->binding;
        desc->texture_sampler_pairs[pair].sampler_slot = (uint8_t)entry->paired_binding;
        desc->texture_sampler_pairs[pair].glsl_name = entry->glsl_name;
        pair += 1;
    }
    for (int i = 0; i < found->storage_count; i += 1) {
        const kg_binding_desc* entry = &found->storages[i];
        const int slot = entry->binding;
        if (slot < 0 || slot >= (int)SG_MAX_VIEW_BINDSLOTS) {
            continue;
        }
        if (entry->stage_mask == 0u) {
            continue;
        }
        desc->views[slot].storage_buffer.stage = kg_stage_from_mask(entry->stage_mask);
        desc->views[slot].storage_buffer.readonly = entry->readonly != 0;
        desc->views[slot].storage_buffer.glsl_binding_n = (uint8_t)entry->glsl_binding;
        desc->views[slot].storage_buffer.hlsl_register_t_n = (uint8_t)slot;
        desc->views[slot].storage_buffer.msl_buffer_n = (uint8_t)(slot + 1);
        desc->views[slot].storage_buffer.wgsl_group1_binding_n = (uint8_t)slot;
        desc->views[slot].storage_buffer.spirv_set1_binding_n = (uint8_t)slot;
    }
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

// Assembles the `kg_shader_info` a caller reports back to Kira: the shader
// id plus the attribute/uniform metadata Kira now keeps on the
// `GraphicsShader` value it holds, in place of the `kg_shader_records` table
// this replaced. `uniform_descs` is truncated to `KG_EXPOSED_UNIFORM_BLOCKS`
// — see its definition for why that is never fewer than a real shader needs.
static kg_shader_info kg_make_shader_info(
    uint32_t shader_id,
    bool has_position_attribute,
    bool has_normal_attribute,
    uint32_t required_uniform_mask,
    uint32_t available_uniform_mask,
    const kg_uniform_block_desc* uniform_descs,
    int uniform_desc_count
) {
    kg_shader_info info = {0};
    info.id = shader_id;
    if (shader_id == 0) {
        return info;
    }
    info.has_position_attribute = has_position_attribute ? 1 : 0;
    info.has_normal_attribute = has_normal_attribute ? 1 : 0;
    info.required_uniform_mask = required_uniform_mask;
    info.available_uniform_mask = available_uniform_mask;
    info.uniform_desc_count = uniform_desc_count > KG_EXPOSED_UNIFORM_BLOCKS ? KG_EXPOSED_UNIFORM_BLOCKS : uniform_desc_count;
    for (int i = 0; i < info.uniform_desc_count; i += 1) {
        info.blocks[i].binding = uniform_descs[i].binding;
        info.blocks[i].size = uniform_descs[i].size;
        info.blocks[i].vertex_block_slot = uniform_descs[i].vertex_block_slot;
        info.blocks[i].fragment_block_slot = uniform_descs[i].fragment_block_slot;
    }
    return info;
}

static kg_shader_info kg_make_shader_with_entries_reflected(
    const char* label,
    const char* vertex_source,
    const char* fragment_source,
    const char* vertex_path,
    const char* fragment_path,
    const char* vertex_entry,
    const char* fragment_entry,
    const char* resource_reflection
) {
    sg_shader_desc desc = {0};
    kg_owned_text prepared_vertex_source = kg_prepare_shader_source_for_sokol(kg_shader_source_owned(vertex_source, vertex_path));
    kg_owned_text prepared_fragment_source = kg_prepare_shader_source_for_sokol(kg_shader_source_owned(fragment_source, fragment_path));
    desc.vertex_func.source = prepared_vertex_source.ptr;
    desc.fragment_func.source = prepared_fragment_source.ptr;
    desc.vertex_func.entry = (vertex_entry != NULL && vertex_entry[0] != '\0') ? vertex_entry : "main";
    desc.fragment_func.entry = (fragment_entry != NULL && fragment_entry[0] != '\0') ? fragment_entry : "main";
    bool has_position_attribute =
        strstr(desc.vertex_func.source, "kira_attr_position") != NULL ||
        strstr(desc.vertex_func.source, "position : TEXCOORD0") != NULL;
    bool has_normal_attribute =
        strstr(desc.vertex_func.source, "kira_attr_normal") != NULL ||
        strstr(desc.vertex_func.source, "normal : TEXCOORD1") != NULL;
    if (has_position_attribute) {
        desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        desc.attrs[0].glsl_name = "kira_attr_position";
        desc.attrs[0].hlsl_sem_name = "TEXCOORD";
        desc.attrs[0].hlsl_sem_index = 0;
    }
    if (has_normal_attribute) {
        desc.attrs[1].base_type = SG_SHADERATTRBASETYPE_FLOAT;
        desc.attrs[1].glsl_name = "kira_attr_normal";
        desc.attrs[1].hlsl_sem_name = "TEXCOORD";
        desc.attrs[1].hlsl_sem_index = 1;
    }

    // Reflection-driven bindings when the KSL macro provided a descriptor
    // string; otherwise fall back to the legacy scene/object source-grep model.
    // `member_name_storage` and `found` must live until sg_make_shader().
    kg_reflected_bindings found;
    char member_name_storage[KG_MAX_UNIFORM_BLOCKS * 2 * KG_MAX_UNIFORM_BLOCK_MEMBERS][80];
    const bool reflected = kg_parse_resource_reflection(resource_reflection, &found);
    uint32_t required_uniform_mask;
    uint32_t available_uniform_mask;
    if (reflected) {
        available_uniform_mask = kg_configure_uniform_blocks_from_descs(
            &desc, found.uniforms, found.uniform_count,
            member_name_storage,
            (int)(sizeof(member_name_storage) / sizeof(member_name_storage[0])));
        // Every declared uniform block must be bound before a draw.
        required_uniform_mask = available_uniform_mask;
        kg_configure_reflected_bindings(&desc, &found);
    } else {
        required_uniform_mask = kg_uniform_mask_from_shader_source(desc.vertex_func.source, desc.fragment_func.source);
        available_uniform_mask = kg_configure_uniform_blocks(&desc, desc.vertex_func.source, desc.fragment_func.source);
        kg_configure_legacy_sampled_textures(&desc, desc.fragment_func.source);
    }

    desc.label = label;
    uint32_t shader_id = sg_make_shader(&desc).id;
    kg_owned_text_deinit(&prepared_vertex_source);
    kg_owned_text_deinit(&prepared_fragment_source);
    return kg_make_shader_info(shader_id, has_position_attribute, has_normal_attribute, required_uniform_mask, available_uniform_mask, found.uniforms, found.uniform_count);
}

static kg_shader_info kg_make_shader_with_entries(
    const char* label,
    const char* vertex_source,
    const char* fragment_source,
    const char* vertex_path,
    const char* fragment_path,
    const char* vertex_entry,
    const char* fragment_entry
) {
    return kg_make_shader_with_entries_reflected(
        label, vertex_source, fragment_source, vertex_path, fragment_path,
        vertex_entry, fragment_entry, NULL);
}

static kg_owned_bytes kg_shader_bytecode_owned(const char* path) {
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
    if (file == NULL || fseek(file, 0, SEEK_END) != 0) {
        if (file != NULL) fclose(file);
        printf("Kira Graphics: could not open shader bytecode '%s'\n", path);
        free(fallback_path);
        return (kg_owned_bytes){ NULL, 0 };
    }
    const long length = ftell(file);
    if (length <= 0) {
        fclose(file);
        printf("Kira Graphics: could not measure shader bytecode '%s'\n", opened_path);
        free(fallback_path);
        return (kg_owned_bytes){ NULL, 0 };
    }
    rewind(file);
    void* buffer = malloc((size_t)length);
    if (buffer == NULL) {
        fclose(file);
        free(fallback_path);
        return (kg_owned_bytes){ NULL, 0 };
    }
    const size_t read_count = fread(buffer, 1, (size_t)length, file);
    fclose(file);
    free(fallback_path);
    return (kg_owned_bytes){ buffer, read_count };
}

static kg_shader_info kg_make_spirv_shader(
    const char* label,
    const char* vertex_path,
    const char* fragment_path,
    const char* metadata_vertex_path,
    const char* metadata_fragment_path,
    const char* vertex_entry,
    const char* fragment_entry
) {
    sg_shader_desc desc = {0};
    kg_owned_bytes vertex_bytecode = kg_shader_bytecode_owned(vertex_path);
    kg_owned_bytes fragment_bytecode = kg_shader_bytecode_owned(fragment_path);
    kg_owned_text vertex_metadata = kg_shader_source_owned("", metadata_vertex_path);
    kg_owned_text fragment_metadata = kg_shader_source_owned("", metadata_fragment_path);
    desc.vertex_func.bytecode = (sg_range){ vertex_bytecode.ptr, vertex_bytecode.size };
    desc.fragment_func.bytecode = (sg_range){ fragment_bytecode.ptr, fragment_bytecode.size };
    desc.vertex_func.entry = vertex_entry;
    desc.fragment_func.entry = fragment_entry;
    const bool has_position_attribute = strstr(vertex_metadata.ptr, "position : TEXCOORD0") != NULL;
    const bool has_normal_attribute = strstr(vertex_metadata.ptr, "normal : TEXCOORD1") != NULL;
    if (has_position_attribute) {
        desc.attrs[0].base_type = SG_SHADERATTRBASETYPE_FLOAT;
    }
    if (has_normal_attribute) {
        desc.attrs[1].base_type = SG_SHADERATTRBASETYPE_FLOAT;
    }
    const uint32_t required_uniform_mask = kg_uniform_mask_from_shader_source(vertex_metadata.ptr, fragment_metadata.ptr);
    const uint32_t available_uniform_mask = kg_configure_uniform_blocks(&desc, vertex_metadata.ptr, fragment_metadata.ptr);
    kg_configure_legacy_sampled_textures(&desc, fragment_metadata.ptr);
    desc.label = label;
    const uint32_t shader_id = sg_make_shader(&desc).id;
    free(vertex_bytecode.ptr);
    free(fragment_bytecode.ptr);
    kg_owned_text_deinit(&vertex_metadata);
    kg_owned_text_deinit(&fragment_metadata);
    return kg_make_shader_info(shader_id, has_position_attribute, has_normal_attribute, required_uniform_mask, available_uniform_mask, NULL, 0);
}

kg_shader_info kg_make_shader(const char* label, const char* vertex_source, const char* fragment_source, const char* vertex_path, const char* fragment_path) {
    return kg_make_shader_with_entries(label, vertex_source, fragment_source, vertex_path, fragment_path, "main", "main");
}

// A KSL shader loaded from the files `kira shader build` wrote.
//
// The `.resources` sidecar beside the stage sources is what says which textures,
// samplers, storage buffers and uniform blocks the shader binds. It is read here
// rather than inferred from the source text: the inference this replaced grepped
// for `kira_tex0_smp0`, a name the shader backend has not emitted since it began
// naming a sampler after the texture it reads, so every textured shader loaded
// from disk bound nothing at all and drew black.
kg_shader_info kg_make_ksl_shader(const char* label, const char* asset, const char* directory) {
    char* resource_path = kg_join_shader_path(directory, asset, ".resources");
    kg_owned_text resources = kg_shader_source_owned("", resource_path ? resource_path : "");
    free(resource_path);
    const char* reflection = resources.ptr;
#if defined(SOKOL_WGPU)
    char* vertex_path = kg_join_shader_path(directory, asset, ".vert.wgsl");
    char* fragment_path = kg_join_shader_path(directory, asset, ".frag.wgsl");
    char* vertex_entry = kg_join_shader_entry(asset, "vertex");
    char* fragment_entry = kg_join_shader_entry(asset, "fragment");
    kg_shader_info info = kg_make_shader_with_entries_reflected(
        label,
        "",
        "",
        vertex_path ? vertex_path : "",
        fragment_path ? fragment_path : "",
        vertex_entry ? vertex_entry : "main",
        fragment_entry ? fragment_entry : "main",
        reflection);
    free(vertex_path);
    free(fragment_path);
    free(vertex_entry);
    free(fragment_entry);
    kg_owned_text_deinit(&resources);
    return info;
#elif defined(SOKOL_VULKAN)
    char* vertex_path = kg_join_shader_path(directory, asset, ".vert.spv");
    char* fragment_path = kg_join_shader_path(directory, asset, ".frag.spv");
    char* metadata_vertex_path = kg_join_shader_path(directory, asset, ".vert.hlsl");
    char* metadata_fragment_path = kg_join_shader_path(directory, asset, ".frag.hlsl");
    char* vertex_entry = kg_join_shader_entry(asset, "vertex");
    char* fragment_entry = kg_join_shader_entry(asset, "fragment");
    kg_shader_info info = kg_make_spirv_shader(
        label,
        vertex_path ? vertex_path : "",
        fragment_path ? fragment_path : "",
        metadata_vertex_path ? metadata_vertex_path : "",
        metadata_fragment_path ? metadata_fragment_path : "",
        "main",
        "main");
    free(vertex_path);
    free(fragment_path);
    free(metadata_vertex_path);
    free(metadata_fragment_path);
    free(vertex_entry);
    free(fragment_entry);
    kg_owned_text_deinit(&resources);
    return info;
#elif defined(SOKOL_D3D11)
    char* vertex_path = kg_join_shader_path(directory, asset, ".vert.hlsl");
    char* fragment_path = kg_join_shader_path(directory, asset, ".frag.hlsl");
    char* vertex_entry = kg_join_shader_entry(asset, "vertex");
    char* fragment_entry = kg_join_shader_entry(asset, "fragment");
    kg_shader_info info = kg_make_shader_with_entries_reflected(
        label,
        "",
        "",
        vertex_path ? vertex_path : "",
        fragment_path ? fragment_path : "",
        vertex_entry ? vertex_entry : "main",
        fragment_entry ? fragment_entry : "main",
        reflection);
    free(vertex_path);
    free(fragment_path);
    free(vertex_entry);
    free(fragment_entry);
    kg_owned_text_deinit(&resources);
    return info;
#else
    char* vertex_path = kg_join_shader_path(directory, asset, ".vert.glsl");
    char* fragment_path = kg_join_shader_path(directory, asset, ".frag.glsl");
    kg_shader_info info = kg_make_shader_with_entries_reflected(
        label, "", "",
        vertex_path ? vertex_path : "",
        fragment_path ? fragment_path : "",
        "main", "main", reflection);
    free(vertex_path);
    free(fragment_path);
    kg_owned_text_deinit(&resources);
    return info;
#endif
}

// Create a shader from inline, precompiled KSL artifact sources (no file IO).
// The `ksl!` compile-time macro embeds every backend's shader text in a
// KslArtifact; this picks the variant the active Sokol backend actually needs:
// WGSL (with the KSL `{Shader}__{stage}__main` entry names) on the WebGPU/wasm
// backend, GLSL (whose stage functions are always `main`) everywhere else.
// Metal is handled in the Kira Graphics layer (metalCreateShader) and never
// reaches this path.
kg_shader_info kg_make_shader_ksl_inline(
    const char* label,
    const char* vertex_wgsl,
    const char* fragment_wgsl,
    const char* vertex_glsl,
    const char* fragment_glsl,
    const char* vertex_entry,
    const char* fragment_entry,
    const char* resource_reflection
) {
#if defined(SOKOL_WGPU)
    return kg_make_shader_with_entries_reflected(
        label,
        vertex_wgsl ? vertex_wgsl : "",
        fragment_wgsl ? fragment_wgsl : "",
        "",
        "",
        (vertex_entry != NULL && vertex_entry[0] != '\0') ? vertex_entry : "main",
        (fragment_entry != NULL && fragment_entry[0] != '\0') ? fragment_entry : "main",
        resource_reflection);
#else
    (void)vertex_wgsl;
    (void)fragment_wgsl;
    (void)vertex_entry;
    (void)fragment_entry;
    return kg_make_shader_with_entries_reflected(
        label,
        vertex_glsl ? vertex_glsl : "",
        fragment_glsl ? fragment_glsl : "",
        "",
        "",
        "main",
        "main",
        resource_reflection);
#endif
}

// Builds both Sokol pipeline objects (the "draw" one and the "indexed" one —
// Sokol pipelines are immutable about index type, so a caller draws through
// whichever one a given call needs) and reports back everything a later draw
// needs to place its uniform uploads: the shader's reflection, passed in by
// the caller (Kira already holds it on the `GraphicsShader` it built the
// pipeline from) rather than looked up from a `kg_shader_records` table.
kg_pipeline_info kg_make_pipeline_detailed(
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
    int64_t topology,
    // Everything the shader's own reflection produced, handed back in because
    // Kira holds it on the `GraphicsShader` value the pipeline is built from —
    // there is no `kg_shader_records` table to look this up from anymore. The
    // four block arrays are parallel and `shader_block_count` long.
    int64_t shader_has_position_attribute,
    int64_t shader_has_normal_attribute,
    uint32_t shader_required_uniform_mask,
    uint32_t shader_available_uniform_mask,
    int64_t shader_block_count,
    const int64_t* block_bindings,
    const uint32_t* block_sizes,
    const int64_t* block_vertex_slots,
    const int64_t* block_fragment_slots
) {
    kg_pipeline_info info = {0};
    const sg_pixel_format swapchain_color_format = _sglue_to_sgpixelformat(sapp_color_format());
    const sg_pixel_format swapchain_depth_format = _sglue_to_sgpixelformat(sapp_depth_format());
    const int swapchain_sample_count = sapp_sample_count();
    sg_pipeline_desc desc = {0};
    desc.shader.id = shader_id;
    desc.layout.buffers[0].stride = (int)vertex_stride;
    desc.layout.buffers[0].step_func = SG_VERTEXSTEP_PER_VERTEX;
    desc.layout.buffers[0].step_rate = 1;

    if (!kg_validate_pipeline_layout(shader_has_position_attribute != 0, shader_has_normal_attribute != 0, vertex_stride, attribute_count, attr0_format, attr0_offset, attr1_format, attr1_offset)) {
        return info;
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
        desc.colors[0].pixel_format = (color_format == -1) ? swapchain_color_format : kg_pixel_format(color_format);
        desc.colors[0].write_mask = SG_COLORMASK_RGBA;
        desc.colors[0].blend = kg_blend_state(blend_enabled != 0, blend_preset);
    }
    desc.primitive_type = kg_primitive_type(topology);
    desc.cull_mode = kg_cull_mode(cull_mode);
    desc.face_winding = kg_face_winding(front_face);
    desc.sample_count = swapchain_sample_count;
    desc.label = label;

    desc.depth.pixel_format = (depth_format == 0) ? SG_PIXELFORMAT_NONE : swapchain_depth_format;
    if (depth_enabled != 0) {
        desc.depth.compare = kg_compare_func(depth_compare);
        desc.depth.write_enabled = depth_write_enabled != 0;
    }

    sg_pipeline_desc draw_desc = desc;
    draw_desc.index_type = SG_INDEXTYPE_NONE;
    uint32_t draw_pipeline_id = sg_make_pipeline(&draw_desc).id;
    if (draw_pipeline_id == 0) {
        return info;
    }

    sg_pipeline_desc indexed_desc = desc;
    indexed_desc.index_type = SG_INDEXTYPE_UINT32;
    uint32_t indexed_pipeline_id = sg_make_pipeline(&indexed_desc).id;
    if (indexed_pipeline_id == 0) {
        sg_pipeline draw_pipeline = { draw_pipeline_id };
        sg_destroy_pipeline(draw_pipeline);
        return info;
    }

    info.draw_pipeline_id = draw_pipeline_id;
    info.indexed_pipeline_id = indexed_pipeline_id;
    info.has_position_attribute = (attribute_count > 0 || shader_has_position_attribute != 0) ? 1 : 0;
    info.required_uniform_mask = shader_required_uniform_mask;
    info.available_uniform_mask = shader_available_uniform_mask;
    info.uniform_desc_count = (int32_t)(shader_block_count > KG_EXPOSED_UNIFORM_BLOCKS ? KG_EXPOSED_UNIFORM_BLOCKS : shader_block_count);
    for (int i = 0; i < info.uniform_desc_count; i += 1) {
        info.blocks[i].binding = (int32_t)block_bindings[i];
        info.blocks[i].size = block_sizes[i];
        info.blocks[i].vertex_block_slot = (int32_t)block_vertex_slots[i];
        info.blocks[i].fragment_block_slot = (int32_t)block_fragment_slots[i];
    }
    return info;
}

void kg_destroy_shader_id(uint32_t shader_id);
void kg_destroy_pipeline_id(uint32_t draw_pipeline_id, uint32_t indexed_pipeline_id);

static uint32_t kg_lifetime_stress_fail(const char* step, int64_t iteration) {
    fprintf(stderr, "Kira Graphics lifetime stress failed at %s on iteration %lld\n", step ? step : "unknown", (long long)iteration);
    return 0;
}

// Creates and destroys every real Sokol resource this file still mints —
// buffers, a texture, an offscreen pass, a shader, a pipeline — on a tight
// loop, then checks `sg_query_stats` came back to zero. Uniforms and bind
// groups are not part of the loop: neither was ever a Sokol resource (see
// `kg_lifetime_outstanding_count`), so there is nothing of theirs left in C
// for a leak to hide in — Kira's own memory holds them now, and reclaiming
// what Kira owns is Kira's job to prove, not this file's.
uint32_t kg_run_lifetime_stress(int64_t iterations, const char* shader_directory, const char* shader_asset) {
    if (iterations <= 0) {
        iterations = 1;
    }

    for (int64_t iteration = 0; iteration < iterations; iteration += 1) {
        uint32_t vertex_buffer = 0;
        uint32_t index_buffer = 0;
        sg_image texture_image = {0};
        uint32_t texture = 0;

        float vertices[18];
        for (int64_t index = 0; index < 18; index += 1) {
            vertices[index] = (float)(index % 3);
        }
        vertex_buffer = kg_stress_make_buffer("lifetime-stress-vertices", false, vertices, sizeof(vertices));
        if (vertex_buffer == 0) {
            return kg_lifetime_stress_fail("finalize vertex buffer", iteration);
        }

        const uint32_t indices[3] = {0, 1, 2};
        index_buffer = kg_stress_make_buffer("lifetime-stress-indices", true, indices, sizeof(indices));
        if (index_buffer == 0) {
            kg_destroy_buffer_id(vertex_buffer);
            return kg_lifetime_stress_fail("finalize index buffer", iteration);
        }

        texture_image = kg_stress_make_color_image(16, 16);
        texture = kg_stress_make_color_view(texture_image);
        if (texture == 0) {
            kg_destroy_buffer_id(index_buffer);
            kg_destroy_buffer_id(vertex_buffer);
            return kg_lifetime_stress_fail("create texture", iteration);
        }
        // An offscreen pass over the texture just created, begun and ended here
        // rather than through Kira's pass path: this loop exists to prove that
        // every Sokol resource it mints is reclaimed, and it runs with no
        // application runtime behind it to record a pass on.
        {
            sg_pass pass = {0};
            pass.label = "lifetime-stress-pass";
            pass.action.colors[0].load_action = SG_LOADACTION_CLEAR;
            pass.action.colors[0].store_action = SG_STOREACTION_STORE;
            pass.attachments.colors[0].id = texture;
            sg_begin_pass(&pass);
            sg_end_pass();
            sg_commit();
        }

        kg_shader_info shader_info = kg_make_ksl_shader("lifetime-stress-ksl-shader", shader_asset ? shader_asset : "LifetimeStress", shader_directory ? shader_directory : "generated/shaders");
        if (shader_info.id == 0) {
            kg_stress_destroy_color(texture_image, texture);
            kg_destroy_buffer_id(index_buffer);
            kg_destroy_buffer_id(vertex_buffer);
            return kg_lifetime_stress_fail("create KSL shader", iteration);
        }
        int64_t block_bindings[KG_EXPOSED_UNIFORM_BLOCKS];
        uint32_t block_sizes[KG_EXPOSED_UNIFORM_BLOCKS];
        int64_t block_vertex_slots[KG_EXPOSED_UNIFORM_BLOCKS];
        int64_t block_fragment_slots[KG_EXPOSED_UNIFORM_BLOCKS];
        for (int block_index = 0; block_index < KG_EXPOSED_UNIFORM_BLOCKS; block_index += 1) {
            block_bindings[block_index] = shader_info.blocks[block_index].binding;
            block_sizes[block_index] = shader_info.blocks[block_index].size;
            block_vertex_slots[block_index] = shader_info.blocks[block_index].vertex_block_slot;
            block_fragment_slots[block_index] = shader_info.blocks[block_index].fragment_block_slot;
        }
        kg_pipeline_info pipeline_info = kg_make_pipeline_detailed(
            shader_info.id, "lifetime-stress-pipeline", 24, 2, 0, 2, 0, 1, 2, 12, 2, 1, 0, 3, 1, 0, 1, 1, 0, 1, 0, 0, 6, 3, 0, 1, 1,
            shader_info.has_position_attribute, shader_info.has_normal_attribute, shader_info.required_uniform_mask, shader_info.available_uniform_mask,
            shader_info.uniform_desc_count,
            block_bindings, block_sizes, block_vertex_slots, block_fragment_slots);
        if (pipeline_info.draw_pipeline_id == 0) {
            kg_destroy_shader_id(shader_info.id);
            kg_stress_destroy_color(texture_image, texture);
            kg_destroy_buffer_id(index_buffer);
            kg_destroy_buffer_id(vertex_buffer);
            return kg_lifetime_stress_fail("create pipeline", iteration);
        }

        kg_destroy_pipeline_id(pipeline_info.draw_pipeline_id, pipeline_info.indexed_pipeline_id);
        kg_destroy_shader_id(shader_info.id);
        kg_stress_destroy_color(texture_image, texture);
        kg_destroy_buffer_id(index_buffer);
        kg_destroy_buffer_id(vertex_buffer);

    }

    kg_owned_text missing = kg_prepare_shader_source_for_sokol(kg_shader_source_owned("", "__missing_lifetime_stress_shader__.glsl"));
    kg_owned_text_deinit(&missing);
    kg_owned_text rewrite_probe = {
        kg_copy_string(
            "layout(std140) uniform scene_Block {\n"
            "    mat4 viewProjection;\n"
            "    vec4 lightDirection;\n"
            "    vec4 lightColor;\n"
            "} scene;\n"
            "layout(std140) uniform object_Block {\n"
            "    mat4 model;\n"
            "    vec4 baseColor;\n"
            "} object;"
        ),
        true,
    };
    if (rewrite_probe.ptr != NULL) {
        rewrite_probe = kg_prepare_shader_source_for_sokol(rewrite_probe);
        kg_owned_text_deinit(&rewrite_probe);
    }

    if (kg_lifetime_outstanding_count() != 0) {
        fprintf(stderr, "Kira Graphics lifetime stress left %d outstanding resources\n", kg_lifetime_outstanding_count());
        return 0;
    }
    fprintf(stderr, "Kira Graphics lifetime stress: pass iterations=%lld\n", (long long)iterations);
    return 1;
}

void kg_destroy_shader_id(uint32_t shader_id) {
    sg_shader shader = { shader_id };
    sg_destroy_shader(shader);
}

// Takes both Sokol pipeline objects a `RenderPipeline` built (see
// `kg_make_pipeline_detailed`) directly, since Kira holds both ids on the
// value it is destroying — there is no `kg_pipeline_records` table left to
// resolve one public id into the pair.
void kg_destroy_pipeline_id(uint32_t draw_pipeline_id, uint32_t indexed_pipeline_id) {
    if (draw_pipeline_id != 0) {
        sg_pipeline draw_pipeline = { draw_pipeline_id };
        sg_destroy_pipeline(draw_pipeline);
    }
    if (indexed_pipeline_id != 0) {
        sg_pipeline indexed_pipeline = { indexed_pipeline_id };
        sg_destroy_pipeline(indexed_pipeline);
    }
}

// --- Swapchain readback ----------------------------------------------------
//
// Reads the presented framebuffer back and writes it as a binary PPM. It is
// what makes a frame on this backend PROVABLE: sokol_gfx exposes no readback of
// any kind, so without this a run here can only report that it submitted a
// frame — which says nothing about what the frame contains. The Metal backend
// has had `metalContextReadPixel` and its image digest since it was written;
// this is the same capability wherever sokol runs.
//
// Called after the frame's last pass has ended and before the window is
// presented, where the default framebuffer holds exactly what a viewer sees.
// GL's origin is bottom-left and an image file's is top-left, so the rows are
// written back to front.
#if defined(SOKOL_GLCORE)
#if defined(_WIN32)
// opengl32.dll exports GL 1.1 directly, so this needs no loader — but sokol
// declares no GL prototypes of its own on Windows, only the enums. (Its own
// X-macro table already carries `glPixelStorei`, so that one is in scope.)
extern void __stdcall glReadPixels(int x, int y, int width, int height, unsigned int format, unsigned int type, void* pixels);
#endif

bool kg_capture_swapchain_ppm(const char* path) {
    if (path == NULL || path[0] == '\0') {
        return false;
    }
    const int width = sapp_width();
    const int height = sapp_height();
    if (width <= 0 || height <= 0) {
        return false;
    }
    const size_t row_bytes = (size_t)width * 3u;
    const size_t total = row_bytes * (size_t)height;
    unsigned char* pixels = (unsigned char*)malloc(total);
    if (pixels == NULL) {
        return false;
    }
    glPixelStorei(0x0D05 /* GL_PACK_ALIGNMENT */, 1);
    glReadPixels(0, 0, width, height, GL_RGB, GL_UNSIGNED_BYTE, pixels);
    FILE* file = fopen(path, "wb");
    if (file == NULL) {
        free(pixels);
        return false;
    }
    fprintf(file, "P6\n%d %d\n255\n", width, height);
    for (int row = height - 1; row >= 0; row -= 1) {
        fwrite(pixels + (size_t)row * row_bytes, 1, row_bytes, file);
    }
    fclose(file);
    free(pixels);
    return true;
}
#else
bool kg_capture_swapchain_ppm(const char* path) {
    (void)path;
    return false;
}
#endif

// Prints the lifetime report Kira asks for, gated behind the same two env
// vars the old table-reading version was. Kira is the one sampling now — it
// owns the running peaks (see `kiraGraphicsSokolFrame`) and reads the current
// `sg_stats` itself through the generated bindings — so this is pure output
// formatting over the two values it hands over, no state of its own.
void kg_report_lifetime(sg_stats stats, kg_lifetime_peaks peaks) {
    if (!kg_lifetime_report_enabled()) {
        return;
    }
    fprintf(stderr,
        "Kira Graphics lifetime report: buffers=%u images=%u samplers=%u views=%u shaders=%u pipelines=%u\n",
        stats.total.buffers.alive,
        stats.total.images.alive,
        stats.total.samplers.alive,
        stats.total.views.alive,
        stats.total.shaders.alive,
        stats.total.pipelines.alive);
    if (kg_lifetime_detail_enabled()) {
        fprintf(stderr,
            "Kira Graphics lifetime detail: buffers current=%u peak=%u allocated=%u deallocated=%u images current=%u peak=%u allocated=%u deallocated=%u samplers current=%u peak=%u allocated=%u deallocated=%u views current=%u peak=%u allocated=%u deallocated=%u shaders current=%u peak=%u allocated=%u deallocated=%u pipelines current=%u peak=%u allocated=%u deallocated=%u\n",
            stats.total.buffers.alive, peaks.buffers, stats.total.buffers.allocated, stats.total.buffers.deallocated,
            stats.total.images.alive, peaks.images, stats.total.images.allocated, stats.total.images.deallocated,
            stats.total.samplers.alive, peaks.samplers, stats.total.samplers.allocated, stats.total.samplers.deallocated,
            stats.total.views.alive, peaks.views, stats.total.views.allocated, stats.total.views.deallocated,
            stats.total.shaders.alive, peaks.shaders, stats.total.shaders.allocated, stats.total.shaders.deallocated,
            stats.total.pipelines.alive, peaks.pipelines, stats.total.pipelines.allocated, stats.total.pipelines.deallocated);
    }
}

static void kg_encode_utf8_from_codepoint(int64_t codepoint, char out[8]) {
    memset(out, 0, 8);
    if (codepoint < 0) {
        return;
    }
    if (codepoint <= 0x7F) {
        out[0] = (char)codepoint;
        out[1] = '\0';
        return;
    }
    if (codepoint <= 0x7FF) {
        out[0] = (char)(0xC0 | ((codepoint >> 6) & 0x1F));
        out[1] = (char)(0x80 | (codepoint & 0x3F));
        out[2] = '\0';
        return;
    }
    if (codepoint <= 0xFFFF) {
        out[0] = (char)(0xE0 | ((codepoint >> 12) & 0x0F));
        out[1] = (char)(0x80 | ((codepoint >> 6) & 0x3F));
        out[2] = (char)(0x80 | (codepoint & 0x3F));
        out[3] = '\0';
        return;
    }
    if (codepoint <= 0x10FFFF) {
        out[0] = (char)(0xF0 | ((codepoint >> 18) & 0x07));
        out[1] = (char)(0x80 | ((codepoint >> 12) & 0x3F));
        out[2] = (char)(0x80 | ((codepoint >> 6) & 0x3F));
        out[3] = (char)(0x80 | (codepoint & 0x3F));
        out[4] = '\0';
    }
}

