#if defined(_WIN32)
#define _CRT_SECURE_NO_WARNINGS
#endif
#define SOKOL_NO_ENTRY
#define SOKOL_GLCORE
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined(_WIN32)
#include <windows.h>
#endif

#if defined(_WIN32)
#define KG_EXPORT __declspec(dllexport)
#else
#define KG_EXPORT
#endif

#define KG_BRIDGE_VALUE_VOID 0
#define KG_BRIDGE_VALUE_INTEGER 1
#define KG_BRIDGE_VALUE_FLOAT 2
#define KG_BRIDGE_VALUE_STRING 3
#define KG_BRIDGE_VALUE_BOOLEAN 4
#define KG_BRIDGE_VALUE_RAW_PTR 5

typedef union {
    int64_t integer;
    double float64;
    struct {
        const unsigned char *ptr;
        size_t len;
    } string;
    uint8_t boolean;
    uintptr_t raw_ptr;
} KiraBridgePayload;

typedef struct {
    uint8_t tag;
    uint8_t reserved[7];
    KiraBridgePayload payload;
} KiraBridgeValue;

typedef struct {
    size_t len;
    KiraBridgeValue *items;
} KiraArray;

typedef struct {
    char *data;
    size_t len;
    size_t cap;
} KGStringBuilder;

static char *kg_sb_take(KGStringBuilder *sb);

typedef enum {
    KG_JSON_NULL = 0,
    KG_JSON_BOOL,
    KG_JSON_NUMBER,
    KG_JSON_STRING,
    KG_JSON_ARRAY,
    KG_JSON_OBJECT,
} KGJsonKind;

typedef struct KGJsonValue KGJsonValue;

typedef struct {
    char *key;
    KGJsonValue *value;
} KGJsonPair;

struct KGJsonValue {
    KGJsonKind kind;
    union {
        bool boolean;
        double number;
        char *string;
        struct {
            KGJsonValue **items;
            size_t count;
        } array;
        struct {
            KGJsonPair *pairs;
            size_t count;
        } object;
    } as;
};

typedef struct {
    const char *cursor;
    const char *end;
    char error[256];
} KGJsonParser;

typedef struct {
    char *name;
    uint32_t offset;
    uint32_t alignment;
    uint32_t size;
    uint32_t stride;
} KGField;

typedef struct {
    char *name;
    uint32_t alignment;
    uint32_t size;
    KGField *fields;
    size_t field_count;
} KGLayout;

typedef struct {
    char *name;
    KGLayout uniform_layout;
    KGLayout storage_layout;
} KGTypeInfo;

typedef struct {
    char *stage;
    char *entry;
    char *input;
    char *output;
} KGStageInfo;

typedef struct {
    char *name;
    char *type;
    char *default_value;
} KGOptionInfo;

typedef struct {
    char *group;
    char *group_class;
    char *resource;
    char *kind;
    char *type;
    int group_index;
    int binding_index;
} KGResourceInfo;

typedef struct {
    char *shader_name;
    char *kind;
    char *backend;
    KGOptionInfo *options;
    size_t option_count;
    KGStageInfo *stages;
    size_t stage_count;
    KGTypeInfo *types;
    size_t type_count;
    KGResourceInfo *resources;
    size_t resource_count;
} KGReflection;

typedef struct {
    char *name;
    char *format_name;
    int components;
    int offset_bytes;
    int size_bytes;
    sg_vertex_format vertex_format;
    sg_shader_attr_base_type base_type;
} KGVertexFieldSpec;

typedef struct {
    KGVertexFieldSpec *fields;
    size_t count;
    int stride_bytes;
    int scalars_per_vertex;
} KGVertexLayoutSpec;

#ifndef KG_NO_RUNTIME
typedef struct {
    char *title;
    int width;
    int height;
    int shader_mode;
    char *vertex_source;
    char *fragment_source;
    char *shader_assets_dir;
    char *shader_name;
    char *vertex_layout_text;
    const KiraArray *vertex_data;
    int vertex_count;
    int instance_count;
    char *label;
    float clear_red;
    float clear_green;
    float clear_blue;
    float clear_alpha;
    char *loaded_vertex_source;
    char *loaded_fragment_source;
    char *loaded_reflection_source;
    KGReflection reflection;
    KGVertexLayoutSpec layout;
    float *packed_vertex_data;
    size_t packed_vertex_scalar_count;
    sg_shader shader;
    sg_pipeline pipeline;
    sg_buffer vertex_buffer;
    sg_bindings bindings;
    bool has_vertex_buffer;
    bool setup_ok;
    char error_message[512];
} KGAppState;
#endif

static void kg_set_error(char *buffer, size_t buffer_size, const char *fmt, ...) {
    va_list args;
    if (buffer == NULL || buffer_size == 0) {
        return;
    }
    va_start(args, fmt);
    vsnprintf(buffer, buffer_size, fmt, args);
    va_end(args);
}

static void kg_trace(const char *fmt, ...) {
    va_list args;
    static int enabled = -1;
    if (enabled == -1) {
        enabled = getenv("KIRA_GRAPHICS_TRACE") != NULL ? 1 : 0;
    }
    if (!enabled) {
        return;
    }
    va_start(args, fmt);
    fprintf(stderr, "[kira-graphics] ");
    vfprintf(stderr, fmt, args);
    fprintf(stderr, "\n");
    fflush(stderr);
    va_end(args);
}

static void kg_sg_logger(
    const char *tag,
    uint32_t log_level,
    uint32_t log_item_id,
    const char *message_or_null,
    uint32_t line_nr,
    const char *filename_or_null,
    void *user_data
) {
    const char *message = message_or_null != NULL ? message_or_null : "<no message>";
    const char *filename = filename_or_null != NULL ? filename_or_null : "<unknown>";
    (void)user_data;
    fprintf(stderr, "[%s] level=%u item=%u %s (%s:%u)\n", tag, (unsigned)log_level, (unsigned)log_item_id, message, filename, (unsigned)line_nr);
    fflush(stderr);
}

static bool kg_sb_reserve(KGStringBuilder *sb, size_t needed) {
    size_t next_cap;
    char *next_data;
    if (needed <= sb->cap) {
        return true;
    }
    next_cap = sb->cap == 0 ? 256 : sb->cap;
    while (next_cap < needed) {
        next_cap *= 2;
    }
    next_data = (char *)realloc(sb->data, next_cap);
    if (next_data == NULL) {
        return false;
    }
    sb->data = next_data;
    sb->cap = next_cap;
    return true;
}

static bool kg_sb_append_len(KGStringBuilder *sb, const char *text, size_t len) {
    if (!kg_sb_reserve(sb, sb->len + len + 1)) {
        return false;
    }
    memcpy(sb->data + sb->len, text, len);
    sb->len += len;
    sb->data[sb->len] = '\0';
    return true;
}

static bool kg_sb_append(KGStringBuilder *sb, const char *text) {
    return kg_sb_append_len(sb, text, strlen(text));
}

static bool kg_sb_appendf(KGStringBuilder *sb, const char *fmt, ...) {
    va_list args;
    va_list args_copy;
    int written;
    size_t needed;
    va_start(args, fmt);
    va_copy(args_copy, args);
    written = vsnprintf(NULL, 0, fmt, args_copy);
    va_end(args_copy);
    if (written < 0) {
        va_end(args);
        return false;
    }
    needed = (size_t)written;
    if (!kg_sb_reserve(sb, sb->len + needed + 1)) {
        va_end(args);
        return false;
    }
    vsnprintf(sb->data + sb->len, sb->cap - sb->len, fmt, args);
    va_end(args);
    sb->len += needed;
    return true;
}

static bool kg_is_ident_start(char c) {
    return ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '_');
}

static bool kg_is_ident_continue(char c) {
    return kg_is_ident_start(c) || (c >= '0' && c <= '9');
}

static char *kg_fixup_glsl_source(const char *source) {
    KGStringBuilder builder = {0};
    size_t i = 0;
    while (source[i] != '\0') {
        if (kg_is_ident_start(source[i])) {
            size_t start = i;
            size_t end = i + 1;
            while (source[end] != '\0' && kg_is_ident_continue(source[end])) {
                end += 1;
            }
            if ((end - start) == 3 && strncmp(source + start, "out", 3) == 0) {
                size_t look = end;
                while (source[look] == ' ' || source[look] == '\t' || source[look] == '\r' || source[look] == '\n') {
                    look += 1;
                }
                if (source[look] == '.' || source[look] == ';' || source[look] == '=' || source[look] == ',' || source[look] == ')') {
                    if (!kg_sb_append(&builder, "kira_out")) {
                        free(builder.data);
                        return NULL;
                    }
                    i = end;
                    continue;
                }
            }
            if (!kg_sb_append_len(&builder, source + start, end - start)) {
                free(builder.data);
                return NULL;
            }
            i = end;
            continue;
        }
        if (!kg_sb_append_len(&builder, source + i, 1)) {
            free(builder.data);
            return NULL;
        }
        i += 1;
    }
    return kg_sb_take(&builder);
}

static char *kg_sb_take(KGStringBuilder *sb) {
    char *result;
    if (sb->data == NULL) {
        sb->data = (char *)malloc(1);
        if (sb->data != NULL) {
            sb->data[0] = '\0';
        }
    }
    result = sb->data;
    sb->data = NULL;
    sb->len = 0;
    sb->cap = 0;
    return result;
}

static char *kg_copy_string(const char *text) {
    size_t len;
    char *out;
    if (text == NULL) {
        return NULL;
    }
    len = strlen(text);
    out = (char *)malloc(len + 1);
    if (out == NULL) {
        return NULL;
    }
    memcpy(out, text, len + 1);
    return out;
}

static char *kg_join_path3(const char *a, const char *b, const char *c) {
    size_t len_a = strlen(a);
    size_t len_b = strlen(b);
    size_t len_c = strlen(c);
    size_t need_sep = (len_a > 0 && a[len_a - 1] != '/' && a[len_a - 1] != '\\') ? 1 : 0;
    char *out = (char *)malloc(len_a + need_sep + len_b + len_c + 1);
    size_t cursor = 0;
    if (out == NULL) {
        return NULL;
    }
    memcpy(out + cursor, a, len_a);
    cursor += len_a;
    if (need_sep) {
        out[cursor++] = '/';
    }
    memcpy(out + cursor, b, len_b);
    cursor += len_b;
    memcpy(out + cursor, c, len_c);
    cursor += len_c;
    out[cursor] = '\0';
    return out;
}

static char *kg_join_path2(const char *a, const char *b) {
    size_t len_a = strlen(a);
    size_t len_b = strlen(b);
    size_t need_sep = (len_a > 0 && a[len_a - 1] != '/' && a[len_a - 1] != '\\') ? 1 : 0;
    char *out = (char *)malloc(len_a + need_sep + len_b + 1);
    size_t cursor = 0;
    if (out == NULL) {
        return NULL;
    }
    memcpy(out + cursor, a, len_a);
    cursor += len_a;
    if (need_sep) {
        out[cursor++] = '/';
    }
    memcpy(out + cursor, b, len_b);
    cursor += len_b;
    out[cursor] = '\0';
    return out;
}

static bool kg_is_absolute_path(const char *path) {
    if (path == NULL || path[0] == '\0') {
        return false;
    }
    if ((path[0] == '\\') || (path[0] == '/')) {
        return true;
    }
    if (((path[0] >= 'A' && path[0] <= 'Z') || (path[0] >= 'a' && path[0] <= 'z')) && path[1] == ':') {
        return true;
    }
    return false;
}

static char *kg_dirname_owned(const char *path) {
    size_t len;
    char *out;
    if (path == NULL) {
        return NULL;
    }
    len = strlen(path);
    while (len > 0) {
        char c = path[len - 1];
        if (c == '/' || c == '\\') {
            break;
        }
        len -= 1;
    }
    if (len == 0) {
        return kg_copy_string(".");
    }
    out = (char *)malloc(len + 1);
    if (out == NULL) {
        return NULL;
    }
    memcpy(out, path, len);
    out[len] = '\0';
    if (len > 1 && (out[len - 1] == '/' || out[len - 1] == '\\')) {
        out[len - 1] = '\0';
    }
    return out;
}

#if defined(_WIN32)
static char *kg_executable_dir(void) {
    char buffer[MAX_PATH];
    DWORD length = GetModuleFileNameA(NULL, buffer, MAX_PATH);
    if (length == 0 || length >= MAX_PATH) {
        return NULL;
    }
    buffer[length] = '\0';
    return kg_dirname_owned(buffer);
}
#else
static char *kg_executable_dir(void) {
    return NULL;
}
#endif

static char *kg_read_text_file(const char *path, char *error_buffer, size_t error_buffer_size) {
    FILE *file;
    long file_size;
    size_t read_size;
    char *buffer;
    file = fopen(path, "rb");
    if (file == NULL) {
        kg_set_error(error_buffer, error_buffer_size, "could not open file: %s", path);
        return NULL;
    }
    if (fseek(file, 0, SEEK_END) != 0) {
        fclose(file);
        kg_set_error(error_buffer, error_buffer_size, "could not seek file: %s", path);
        return NULL;
    }
    file_size = ftell(file);
    if (file_size < 0) {
        fclose(file);
        kg_set_error(error_buffer, error_buffer_size, "could not read file size: %s", path);
        return NULL;
    }
    if (fseek(file, 0, SEEK_SET) != 0) {
        fclose(file);
        kg_set_error(error_buffer, error_buffer_size, "could not rewind file: %s", path);
        return NULL;
    }
    buffer = (char *)malloc((size_t)file_size + 1);
    if (buffer == NULL) {
        fclose(file);
        kg_set_error(error_buffer, error_buffer_size, "out of memory while reading file: %s", path);
        return NULL;
    }
    read_size = fread(buffer, 1, (size_t)file_size, file);
    fclose(file);
    if (read_size != (size_t)file_size) {
        free(buffer);
        kg_set_error(error_buffer, error_buffer_size, "short read while reading file: %s", path);
        return NULL;
    }
    buffer[read_size] = '\0';
    return buffer;
}

static void kg_json_skip_ws(KGJsonParser *parser) {
    while (parser->cursor < parser->end) {
        char c = *parser->cursor;
        if (c == ' ' || c == '\n' || c == '\r' || c == '\t') {
            parser->cursor += 1;
            continue;
        }
        break;
    }
}

static bool kg_json_consume(KGJsonParser *parser, char expected) {
    kg_json_skip_ws(parser);
    if (parser->cursor >= parser->end || *parser->cursor != expected) {
        kg_set_error(parser->error, sizeof(parser->error), "expected '%c' in reflection json", expected);
        return false;
    }
    parser->cursor += 1;
    return true;
}

static char *kg_json_parse_string_raw(KGJsonParser *parser) {
    KGStringBuilder builder = {0};
    if (!kg_json_consume(parser, '"')) {
        return NULL;
    }
    while (parser->cursor < parser->end) {
        char c = *parser->cursor++;
        if (c == '"') {
            return builder.data == NULL ? kg_copy_string("") : builder.data;
        }
        if (c == '\\') {
            char escaped;
            if (parser->cursor >= parser->end) {
                free(builder.data);
                kg_set_error(parser->error, sizeof(parser->error), "unterminated escape sequence in reflection json");
                return NULL;
            }
            escaped = *parser->cursor++;
            switch (escaped) {
                case '"': c = '"'; break;
                case '\\': c = '\\'; break;
                case '/': c = '/'; break;
                case 'b': c = '\b'; break;
                case 'f': c = '\f'; break;
                case 'n': c = '\n'; break;
                case 'r': c = '\r'; break;
                case 't': c = '\t'; break;
                default:
                    free(builder.data);
                    kg_set_error(parser->error, sizeof(parser->error), "unsupported json escape \\%c", escaped);
                    return NULL;
            }
        }
        if (!kg_sb_append_len(&builder, &c, 1)) {
            free(builder.data);
            kg_set_error(parser->error, sizeof(parser->error), "out of memory while parsing reflection json string");
            return NULL;
        }
    }
    free(builder.data);
    kg_set_error(parser->error, sizeof(parser->error), "unterminated reflection json string");
    return NULL;
}

static KGJsonValue *kg_json_new_value(KGJsonKind kind) {
    KGJsonValue *value = (KGJsonValue *)calloc(1, sizeof(KGJsonValue));
    if (value != NULL) {
        value->kind = kind;
    }
    return value;
}

static KGJsonValue *kg_json_parse_value(KGJsonParser *parser);

static KGJsonValue *kg_json_parse_array(KGJsonParser *parser) {
    KGJsonValue *value = kg_json_new_value(KG_JSON_ARRAY);
    if (value == NULL) {
        kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json array");
        return NULL;
    }
    if (!kg_json_consume(parser, '[')) {
        free(value);
        return NULL;
    }
    kg_json_skip_ws(parser);
    if (parser->cursor < parser->end && *parser->cursor == ']') {
        parser->cursor += 1;
        return value;
    }
    for (;;) {
        KGJsonValue *item = kg_json_parse_value(parser);
        KGJsonValue **next_items;
        if (item == NULL) {
            free(value);
            return NULL;
        }
        next_items = (KGJsonValue **)realloc(value->as.array.items, (value->as.array.count + 1) * sizeof(KGJsonValue *));
        if (next_items == NULL) {
            free(item);
            free(value->as.array.items);
            free(value);
            kg_set_error(parser->error, sizeof(parser->error), "out of memory while growing reflection json array");
            return NULL;
        }
        value->as.array.items = next_items;
        value->as.array.items[value->as.array.count++] = item;
        kg_json_skip_ws(parser);
        if (parser->cursor < parser->end && *parser->cursor == ',') {
            parser->cursor += 1;
            continue;
        }
        break;
    }
    if (!kg_json_consume(parser, ']')) {
        free(value->as.array.items);
        free(value);
        return NULL;
    }
    return value;
}

static KGJsonValue *kg_json_parse_object(KGJsonParser *parser) {
    KGJsonValue *value = kg_json_new_value(KG_JSON_OBJECT);
    if (value == NULL) {
        kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json object");
        return NULL;
    }
    if (!kg_json_consume(parser, '{')) {
        free(value);
        return NULL;
    }
    kg_json_skip_ws(parser);
    if (parser->cursor < parser->end && *parser->cursor == '}') {
        parser->cursor += 1;
        return value;
    }
    for (;;) {
        char *key;
        KGJsonValue *item;
        KGJsonPair *next_pairs;
        key = kg_json_parse_string_raw(parser);
        if (key == NULL) {
            free(value);
            return NULL;
        }
        if (!kg_json_consume(parser, ':')) {
            free(key);
            free(value);
            return NULL;
        }
        item = kg_json_parse_value(parser);
        if (item == NULL) {
            free(key);
            free(value);
            return NULL;
        }
        next_pairs = (KGJsonPair *)realloc(value->as.object.pairs, (value->as.object.count + 1) * sizeof(KGJsonPair));
        if (next_pairs == NULL) {
            free(key);
            free(item);
            free(value->as.object.pairs);
            free(value);
            kg_set_error(parser->error, sizeof(parser->error), "out of memory while growing reflection json object");
            return NULL;
        }
        value->as.object.pairs = next_pairs;
        value->as.object.pairs[value->as.object.count].key = key;
        value->as.object.pairs[value->as.object.count].value = item;
        value->as.object.count += 1;
        kg_json_skip_ws(parser);
        if (parser->cursor < parser->end && *parser->cursor == ',') {
            parser->cursor += 1;
            continue;
        }
        break;
    }
    if (!kg_json_consume(parser, '}')) {
        free(value->as.object.pairs);
        free(value);
        return NULL;
    }
    return value;
}

static KGJsonValue *kg_json_parse_number(KGJsonParser *parser) {
    const char *start;
    char *end_ptr = NULL;
    double parsed;
    KGJsonValue *value;
    kg_json_skip_ws(parser);
    start = parser->cursor;
    parsed = strtod(start, &end_ptr);
    if (end_ptr == start) {
        kg_set_error(parser->error, sizeof(parser->error), "expected json number in reflection");
        return NULL;
    }
    parser->cursor = end_ptr;
    value = kg_json_new_value(KG_JSON_NUMBER);
    if (value == NULL) {
        kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json number");
        return NULL;
    }
    value->as.number = parsed;
    return value;
}

static KGJsonValue *kg_json_parse_value(KGJsonParser *parser) {
    kg_json_skip_ws(parser);
    if (parser->cursor >= parser->end) {
        kg_set_error(parser->error, sizeof(parser->error), "unexpected end of reflection json");
        return NULL;
    }
    switch (*parser->cursor) {
        case '"': {
            KGJsonValue *value = kg_json_new_value(KG_JSON_STRING);
            if (value == NULL) {
                kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json string");
                return NULL;
            }
            value->as.string = kg_json_parse_string_raw(parser);
            if (value->as.string == NULL) {
                free(value);
                return NULL;
            }
            return value;
        }
        case '{':
            return kg_json_parse_object(parser);
        case '[':
            return kg_json_parse_array(parser);
        case 't':
            if ((size_t)(parser->end - parser->cursor) >= 4 && strncmp(parser->cursor, "true", 4) == 0) {
                KGJsonValue *value = kg_json_new_value(KG_JSON_BOOL);
                if (value == NULL) {
                    kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json bool");
                    return NULL;
                }
                value->as.boolean = true;
                parser->cursor += 4;
                return value;
            }
            break;
        case 'f':
            if ((size_t)(parser->end - parser->cursor) >= 5 && strncmp(parser->cursor, "false", 5) == 0) {
                KGJsonValue *value = kg_json_new_value(KG_JSON_BOOL);
                if (value == NULL) {
                    kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json bool");
                    return NULL;
                }
                value->as.boolean = false;
                parser->cursor += 5;
                return value;
            }
            break;
        case 'n':
            if ((size_t)(parser->end - parser->cursor) >= 4 && strncmp(parser->cursor, "null", 4) == 0) {
                KGJsonValue *value = kg_json_new_value(KG_JSON_NULL);
                if (value == NULL) {
                    kg_set_error(parser->error, sizeof(parser->error), "out of memory while allocating reflection json null");
                    return NULL;
                }
                parser->cursor += 4;
                return value;
            }
            break;
        default:
            if (*parser->cursor == '-' || (*parser->cursor >= '0' && *parser->cursor <= '9')) {
                return kg_json_parse_number(parser);
            }
            break;
    }
    kg_set_error(parser->error, sizeof(parser->error), "unexpected token in reflection json");
    return NULL;
}

static void kg_json_free(KGJsonValue *value) {
    size_t index;
    if (value == NULL) {
        return;
    }
    switch (value->kind) {
        case KG_JSON_STRING:
            free(value->as.string);
            break;
        case KG_JSON_ARRAY:
            for (index = 0; index < value->as.array.count; index += 1) {
                kg_json_free(value->as.array.items[index]);
            }
            free(value->as.array.items);
            break;
        case KG_JSON_OBJECT:
            for (index = 0; index < value->as.object.count; index += 1) {
                free(value->as.object.pairs[index].key);
                kg_json_free(value->as.object.pairs[index].value);
            }
            free(value->as.object.pairs);
            break;
        default:
            break;
    }
    free(value);
}

static KGJsonValue *kg_json_object_get(const KGJsonValue *object, const char *key) {
    size_t index;
    if (object == NULL || object->kind != KG_JSON_OBJECT) {
        return NULL;
    }
    for (index = 0; index < object->as.object.count; index += 1) {
        if (strcmp(object->as.object.pairs[index].key, key) == 0) {
            return object->as.object.pairs[index].value;
        }
    }
    return NULL;
}

static const char *kg_json_expect_string(const KGJsonValue *object, const char *key, char *error, size_t error_size) {
    KGJsonValue *value = kg_json_object_get(object, key);
    if (value == NULL || value->kind != KG_JSON_STRING) {
        kg_set_error(error, error_size, "reflection key '%s' is missing or not a string", key);
        return NULL;
    }
    return value->as.string;
}

static int kg_json_expect_int(const KGJsonValue *object, const char *key, char *error, size_t error_size, bool *ok) {
    KGJsonValue *value = kg_json_object_get(object, key);
    if (value == NULL || value->kind != KG_JSON_NUMBER) {
        kg_set_error(error, error_size, "reflection key '%s' is missing or not a number", key);
        *ok = false;
        return 0;
    }
    *ok = true;
    return (int)value->as.number;
}

static void kg_free_layout(KGLayout *layout) {
    size_t index;
    for (index = 0; index < layout->field_count; index += 1) {
        free(layout->fields[index].name);
    }
    free(layout->fields);
    memset(layout, 0, sizeof(*layout));
}

static void kg_free_reflection(KGReflection *reflection) {
    size_t index;
    free(reflection->shader_name);
    free(reflection->kind);
    free(reflection->backend);
    for (index = 0; index < reflection->option_count; index += 1) {
        free(reflection->options[index].name);
        free(reflection->options[index].type);
        free(reflection->options[index].default_value);
    }
    free(reflection->options);
    for (index = 0; index < reflection->stage_count; index += 1) {
        free(reflection->stages[index].stage);
        free(reflection->stages[index].entry);
        free(reflection->stages[index].input);
        free(reflection->stages[index].output);
    }
    free(reflection->stages);
    for (index = 0; index < reflection->type_count; index += 1) {
        free(reflection->types[index].name);
        kg_free_layout(&reflection->types[index].uniform_layout);
        kg_free_layout(&reflection->types[index].storage_layout);
    }
    free(reflection->types);
    for (index = 0; index < reflection->resource_count; index += 1) {
        free(reflection->resources[index].group);
        free(reflection->resources[index].group_class);
        free(reflection->resources[index].resource);
        free(reflection->resources[index].kind);
        free(reflection->resources[index].type);
    }
    free(reflection->resources);
    memset(reflection, 0, sizeof(*reflection));
}

static bool kg_parse_layout_fields(KGLayout *layout, const KGJsonValue *layout_value, char *error, size_t error_size) {
    KGJsonValue *fields_value;
    size_t index;
    bool ok = false;
    if (layout_value == NULL || layout_value->kind != KG_JSON_OBJECT) {
        return true;
    }
    layout->alignment = (uint32_t)kg_json_expect_int(layout_value, "alignment", error, error_size, &ok);
    if (!ok) return false;
    layout->size = (uint32_t)kg_json_expect_int(layout_value, "size", error, error_size, &ok);
    if (!ok) return false;
    fields_value = kg_json_object_get(layout_value, "fields");
    if (fields_value == NULL || fields_value->kind != KG_JSON_ARRAY) {
        kg_set_error(error, error_size, "reflection layout fields missing or not an array");
        return false;
    }
    layout->fields = (KGField *)calloc(fields_value->as.array.count, sizeof(KGField));
    if (layout->fields == NULL && fields_value->as.array.count != 0) {
        kg_set_error(error, error_size, "out of memory while allocating reflection layout fields");
        return false;
    }
    layout->field_count = fields_value->as.array.count;
    for (index = 0; index < fields_value->as.array.count; index += 1) {
        KGJsonValue *field_object = fields_value->as.array.items[index];
        if (field_object == NULL || field_object->kind != KG_JSON_OBJECT) {
            kg_set_error(error, error_size, "reflection layout field entry is not an object");
            return false;
        }
        layout->fields[index].name = kg_copy_string(kg_json_expect_string(field_object, "name", error, error_size));
        if (layout->fields[index].name == NULL) {
            kg_set_error(error, error_size, "out of memory while copying reflection layout field name");
            return false;
        }
        layout->fields[index].offset = (uint32_t)kg_json_expect_int(field_object, "offset", error, error_size, &ok);
        if (!ok) return false;
        layout->fields[index].alignment = (uint32_t)kg_json_expect_int(field_object, "alignment", error, error_size, &ok);
        if (!ok) return false;
        layout->fields[index].size = (uint32_t)kg_json_expect_int(field_object, "size", error, error_size, &ok);
        if (!ok) return false;
        layout->fields[index].stride = (uint32_t)kg_json_expect_int(field_object, "stride", error, error_size, &ok);
        if (!ok) return false;
    }
    return true;
}

static bool kg_parse_reflection(KGReflection *reflection, const char *json, char *error, size_t error_size) {
    KGJsonParser parser;
    KGJsonValue *root;
    KGJsonValue *options_value;
    KGJsonValue *stages_value;
    KGJsonValue *types_value;
    KGJsonValue *resources_value;
    size_t index;

    memset(reflection, 0, sizeof(*reflection));
    memset(&parser, 0, sizeof(parser));
    parser.cursor = json;
    parser.end = json + strlen(json);
    root = kg_json_parse_value(&parser);
    if (root == NULL) {
        kg_set_error(error, error_size, "%s", parser.error);
        return false;
    }
    if (root->kind != KG_JSON_OBJECT) {
        kg_json_free(root);
        kg_set_error(error, error_size, "reflection root must be an object");
        return false;
    }

    reflection->shader_name = kg_copy_string(kg_json_expect_string(root, "shader", error, error_size));
    reflection->kind = kg_copy_string(kg_json_expect_string(root, "kind", error, error_size));
    reflection->backend = kg_copy_string(kg_json_expect_string(root, "backend", error, error_size));
    if (reflection->shader_name == NULL || reflection->kind == NULL || reflection->backend == NULL) {
        kg_json_free(root);
        kg_set_error(error, error_size, "out of memory while copying core reflection fields");
        kg_free_reflection(reflection);
        return false;
    }

    options_value = kg_json_object_get(root, "options");
    if (options_value == NULL || options_value->kind != KG_JSON_ARRAY) {
        kg_json_free(root);
        kg_set_error(error, error_size, "reflection options missing or not an array");
        kg_free_reflection(reflection);
        return false;
    }
    reflection->options = (KGOptionInfo *)calloc(options_value->as.array.count, sizeof(KGOptionInfo));
    reflection->option_count = options_value->as.array.count;
    for (index = 0; index < options_value->as.array.count; index += 1) {
        KGJsonValue *option_object = options_value->as.array.items[index];
        if (option_object == NULL || option_object->kind != KG_JSON_OBJECT) {
            kg_json_free(root);
            kg_set_error(error, error_size, "reflection option entry is not an object");
            kg_free_reflection(reflection);
            return false;
        }
        reflection->options[index].name = kg_copy_string(kg_json_expect_string(option_object, "name", error, error_size));
        reflection->options[index].type = kg_copy_string(kg_json_expect_string(option_object, "type", error, error_size));
        reflection->options[index].default_value = kg_copy_string(kg_json_expect_string(option_object, "default", error, error_size));
    }

    stages_value = kg_json_object_get(root, "stages");
    if (stages_value == NULL || stages_value->kind != KG_JSON_ARRAY) {
        kg_json_free(root);
        kg_set_error(error, error_size, "reflection stages missing or not an array");
        kg_free_reflection(reflection);
        return false;
    }
    reflection->stages = (KGStageInfo *)calloc(stages_value->as.array.count, sizeof(KGStageInfo));
    reflection->stage_count = stages_value->as.array.count;
    for (index = 0; index < stages_value->as.array.count; index += 1) {
        KGJsonValue *stage_object = stages_value->as.array.items[index];
        if (stage_object == NULL || stage_object->kind != KG_JSON_OBJECT) {
            kg_json_free(root);
            kg_set_error(error, error_size, "reflection stage entry is not an object");
            kg_free_reflection(reflection);
            return false;
        }
        reflection->stages[index].stage = kg_copy_string(kg_json_expect_string(stage_object, "stage", error, error_size));
        reflection->stages[index].entry = kg_copy_string(kg_json_expect_string(stage_object, "entry", error, error_size));
        reflection->stages[index].input = kg_copy_string(kg_json_expect_string(stage_object, "input", error, error_size));
        reflection->stages[index].output = kg_copy_string(kg_json_expect_string(stage_object, "output", error, error_size));
    }

    types_value = kg_json_object_get(root, "types");
    if (types_value == NULL || types_value->kind != KG_JSON_ARRAY) {
        kg_json_free(root);
        kg_set_error(error, error_size, "reflection types missing or not an array");
        kg_free_reflection(reflection);
        return false;
    }
    reflection->types = (KGTypeInfo *)calloc(types_value->as.array.count, sizeof(KGTypeInfo));
    reflection->type_count = types_value->as.array.count;
    for (index = 0; index < types_value->as.array.count; index += 1) {
        KGJsonValue *type_object = types_value->as.array.items[index];
        KGJsonValue *uniform_layout;
        KGJsonValue *storage_layout;
        if (type_object == NULL || type_object->kind != KG_JSON_OBJECT) {
            kg_json_free(root);
            kg_set_error(error, error_size, "reflection type entry is not an object");
            kg_free_reflection(reflection);
            return false;
        }
        reflection->types[index].name = kg_copy_string(kg_json_expect_string(type_object, "name", error, error_size));
        uniform_layout = kg_json_object_get(type_object, "uniform_layout");
        storage_layout = kg_json_object_get(type_object, "storage_layout");
        if (!kg_parse_layout_fields(&reflection->types[index].uniform_layout, uniform_layout, error, error_size)) {
            kg_json_free(root);
            kg_free_reflection(reflection);
            return false;
        }
        if (!kg_parse_layout_fields(&reflection->types[index].storage_layout, storage_layout, error, error_size)) {
            kg_json_free(root);
            kg_free_reflection(reflection);
            return false;
        }
    }

    resources_value = kg_json_object_get(root, "resources");
    if (resources_value == NULL || resources_value->kind != KG_JSON_ARRAY) {
        kg_json_free(root);
        kg_set_error(error, error_size, "reflection resources missing or not an array");
        kg_free_reflection(reflection);
        return false;
    }
    reflection->resources = (KGResourceInfo *)calloc(resources_value->as.array.count, sizeof(KGResourceInfo));
    reflection->resource_count = resources_value->as.array.count;
    for (index = 0; index < resources_value->as.array.count; index += 1) {
        KGJsonValue *resource_object = resources_value->as.array.items[index];
        bool ok = false;
        if (resource_object == NULL || resource_object->kind != KG_JSON_OBJECT) {
            kg_json_free(root);
            kg_set_error(error, error_size, "reflection resource entry is not an object");
            kg_free_reflection(reflection);
            return false;
        }
        reflection->resources[index].group = kg_copy_string(kg_json_expect_string(resource_object, "group", error, error_size));
        reflection->resources[index].group_class = kg_copy_string(kg_json_expect_string(resource_object, "class", error, error_size));
        reflection->resources[index].resource = kg_copy_string(kg_json_expect_string(resource_object, "resource", error, error_size));
        reflection->resources[index].kind = kg_copy_string(kg_json_expect_string(resource_object, "kind", error, error_size));
        reflection->resources[index].type = kg_copy_string(kg_json_expect_string(resource_object, "type", error, error_size));
        reflection->resources[index].group_index = kg_json_expect_int(resource_object, "group_index", error, error_size, &ok);
        if (!ok) {
            kg_json_free(root);
            kg_free_reflection(reflection);
            return false;
        }
        reflection->resources[index].binding_index = kg_json_expect_int(resource_object, "binding_index", error, error_size, &ok);
        if (!ok) {
            kg_json_free(root);
            kg_free_reflection(reflection);
            return false;
        }
    }

    kg_json_free(root);
    return true;
}

static const KGStageInfo *kg_find_stage(const KGReflection *reflection, const char *stage_name) {
    size_t index;
    for (index = 0; index < reflection->stage_count; index += 1) {
        if (strcmp(reflection->stages[index].stage, stage_name) == 0) {
            return &reflection->stages[index];
        }
    }
    return NULL;
}

static const KGTypeInfo *kg_find_type(const KGReflection *reflection, const char *type_name) {
    size_t index;
    for (index = 0; index < reflection->type_count; index += 1) {
        if (strcmp(reflection->types[index].name, type_name) == 0) {
            return &reflection->types[index];
        }
    }
    return NULL;
}

static const KGLayout *kg_primary_layout(const KGTypeInfo *type_info) {
    if (type_info->storage_layout.field_count > 0) {
        return &type_info->storage_layout;
    }
    if (type_info->uniform_layout.field_count > 0) {
        return &type_info->uniform_layout;
    }
    return NULL;
}

static void kg_free_vertex_layout(KGVertexLayoutSpec *layout) {
    size_t index;
    for (index = 0; index < layout->count; index += 1) {
        free(layout->fields[index].name);
        free(layout->fields[index].format_name);
    }
    free(layout->fields);
    memset(layout, 0, sizeof(*layout));
}

static bool kg_push_vertex_field(KGVertexLayoutSpec *layout, KGVertexFieldSpec field, char *error, size_t error_size) {
    KGVertexFieldSpec *next_fields = (KGVertexFieldSpec *)realloc(layout->fields, (layout->count + 1) * sizeof(KGVertexFieldSpec));
    if (next_fields == NULL) {
        kg_set_error(error, error_size, "out of memory while growing vertex layout");
        return false;
    }
    layout->fields = next_fields;
    layout->fields[layout->count++] = field;
    layout->stride_bytes += field.size_bytes;
    layout->scalars_per_vertex += field.components;
    return true;
}

static bool kg_parse_vertex_layout(KGVertexLayoutSpec *layout, const char *text, char *error, size_t error_size) {
    const char *cursor = text;
    memset(layout, 0, sizeof(*layout));
    if (text == NULL || text[0] == '\0') {
        return true;
    }
    while (*cursor != '\0') {
        const char *name_start;
        const char *name_end;
        const char *format_start;
        const char *format_end;
        char *name;
        char *format_name;
        KGVertexFieldSpec field;
        while (*cursor == ' ' || *cursor == '\t' || *cursor == ';' || *cursor == ',') {
            cursor += 1;
        }
        if (*cursor == '\0') {
            break;
        }
        name_start = cursor;
        while (*cursor != '\0' && *cursor != '=' && *cursor != ' ' && *cursor != '\t') {
            cursor += 1;
        }
        name_end = cursor;
        while (*cursor == ' ' || *cursor == '\t') {
            cursor += 1;
        }
        if (*cursor != '=') {
            kg_set_error(error, error_size, "vertex layout must use name=format entries");
            kg_free_vertex_layout(layout);
            return false;
        }
        cursor += 1;
        while (*cursor == ' ' || *cursor == '\t') {
            cursor += 1;
        }
        format_start = cursor;
        while (*cursor != '\0' && *cursor != ';' && *cursor != ',' && *cursor != ' ' && *cursor != '\t') {
            cursor += 1;
        }
        format_end = cursor;
        name = (char *)malloc((size_t)(name_end - name_start) + 1);
        format_name = (char *)malloc((size_t)(format_end - format_start) + 1);
        if (name == NULL || format_name == NULL) {
            free(name);
            free(format_name);
            kg_set_error(error, error_size, "out of memory while parsing vertex layout");
            kg_free_vertex_layout(layout);
            return false;
        }
        memcpy(name, name_start, (size_t)(name_end - name_start));
        name[name_end - name_start] = '\0';
        memcpy(format_name, format_start, (size_t)(format_end - format_start));
        format_name[format_end - format_start] = '\0';
        memset(&field, 0, sizeof(field));
        field.name = name;
        field.format_name = format_name;
        field.offset_bytes = layout->stride_bytes;
        field.base_type = SG_SHADERATTRBASETYPE_FLOAT;
        if (strcmp(format_name, "float") == 0) {
            field.components = 1;
            field.size_bytes = 4;
            field.vertex_format = SG_VERTEXFORMAT_FLOAT;
        } else if (strcmp(format_name, "float2") == 0) {
            field.components = 2;
            field.size_bytes = 8;
            field.vertex_format = SG_VERTEXFORMAT_FLOAT2;
        } else if (strcmp(format_name, "float3") == 0) {
            field.components = 3;
            field.size_bytes = 12;
            field.vertex_format = SG_VERTEXFORMAT_FLOAT3;
        } else if (strcmp(format_name, "float4") == 0) {
            field.components = 4;
            field.size_bytes = 16;
            field.vertex_format = SG_VERTEXFORMAT_FLOAT4;
        } else {
            free(name);
            free(format_name);
            kg_set_error(error, error_size, "unsupported vertex format '%s'; use float, float2, float3, or float4", format_name);
            kg_free_vertex_layout(layout);
            return false;
        }
        if (!kg_push_vertex_field(layout, field, error, error_size)) {
            free(name);
            free(format_name);
            kg_free_vertex_layout(layout);
            return false;
        }
        while (*cursor == ' ' || *cursor == '\t') {
            cursor += 1;
        }
        if (*cursor == ';' || *cursor == ',') {
            cursor += 1;
        }
    }
    return true;
}

static bool kg_validate_reflection(const KGReflection *reflection, const KGVertexLayoutSpec *layout, bool require_runtime_bindings, char *error, size_t error_size) {
    const KGStageInfo *vertex_stage = kg_find_stage(reflection, "vertex");
    const KGStageInfo *fragment_stage = kg_find_stage(reflection, "fragment");
    const KGStageInfo *compute_stage = kg_find_stage(reflection, "compute");
    const KGTypeInfo *vertex_input_type = NULL;
    const KGLayout *vertex_input_layout = NULL;
    size_t index;

    if (strcmp(reflection->kind, "graphics") != 0) {
        kg_set_error(error, error_size, "unsupported shader kind '%s'; Kira Graphics currently supports graphics shaders only", reflection->kind);
        return false;
    }
    if (strcmp(reflection->backend, "glsl_330") != 0) {
        kg_set_error(error, error_size, "unsupported shader backend '%s'; Kira Graphics currently consumes glsl_330 assets only", reflection->backend);
        return false;
    }
    if (compute_stage != NULL) {
        kg_set_error(error, error_size, "compute shaders are not supported by the current Kira Graphics GLSL 330 backend");
        return false;
    }
    if (vertex_stage == NULL || fragment_stage == NULL) {
        kg_set_error(error, error_size, "reflection must include both vertex and fragment stages");
        return false;
    }
    if (vertex_stage->input != NULL && vertex_stage->input[0] != '\0') {
        vertex_input_type = kg_find_type(reflection, vertex_stage->input);
        if (vertex_input_type == NULL) {
            kg_set_error(error, error_size, "vertex stage input type '%s' was not found in reflection types", vertex_stage->input);
            return false;
        }
        vertex_input_layout = kg_primary_layout(vertex_input_type);
        if (vertex_input_layout == NULL) {
            kg_set_error(error, error_size, "vertex input type '%s' does not expose layout fields in reflection", vertex_stage->input);
            return false;
        }
        if (layout->count != vertex_input_layout->field_count) {
            kg_set_error(error, error_size, "vertex layout field count mismatch: reflection expects %d field(s) for %s but the scene provided %d", (int)vertex_input_layout->field_count, vertex_stage->input, (int)layout->count);
            return false;
        }
        for (index = 0; index < layout->count; index += 1) {
            if (strcmp(layout->fields[index].name, vertex_input_layout->fields[index].name) != 0) {
                kg_set_error(
                    error,
                    error_size,
                    "vertex layout mismatch at slot %d: reflection expects '%s' but the scene provided '%s'",
                    (int)index,
                    vertex_input_layout->fields[index].name,
                    layout->fields[index].name
                );
                return false;
            }
        }
    } else if (layout->count > 0) {
        kg_set_error(error, error_size, "vertex layout was provided but the reflection does not declare vertex input fields");
        return false;
    }
    if (require_runtime_bindings && reflection->resource_count > 0) {
        kg_set_error(
            error,
            error_size,
            "resource binding is not implemented yet for KSL assets in Kira Graphics; first unsupported resource is %s.%s (%s)",
            reflection->resources[0].group,
            reflection->resources[0].resource,
            reflection->resources[0].kind
        );
        return false;
    }
    return true;
}

#ifndef KG_NO_RUNTIME
static bool kg_pack_vertex_data(KGAppState *state) {
    size_t expected_scalars;
    size_t index;
    if (state->layout.count == 0) {
        return true;
    }
    if (state->vertex_data == NULL) {
        kg_set_error(state->error_message, sizeof(state->error_message), "vertex data is required for KSL shaders with vertex input");
        return false;
    }
    expected_scalars = (size_t)state->vertex_count * (size_t)state->layout.scalars_per_vertex;
    if (state->vertex_data->len != expected_scalars) {
        kg_set_error(
            state->error_message,
            sizeof(state->error_message),
            "vertex data length mismatch: vertex_count=%d and layout=%d scalar(s)/vertex require %d value(s), but the scene provided %d",
            state->vertex_count,
            state->layout.scalars_per_vertex,
            (int)expected_scalars,
            (int)state->vertex_data->len
        );
        return false;
    }
    state->packed_vertex_data = (float *)malloc(expected_scalars * sizeof(float));
    if (state->packed_vertex_data == NULL) {
        kg_set_error(state->error_message, sizeof(state->error_message), "out of memory while packing vertex data");
        return false;
    }
    state->packed_vertex_scalar_count = expected_scalars;
    for (index = 0; index < expected_scalars; index += 1) {
        const KiraBridgeValue *item = &state->vertex_data->items[index];
        kg_trace("vertex_data[%d] tag=%u raw=%llu", (int)index, (unsigned)item->tag, (unsigned long long)item->payload.integer);
        if (item->tag == KG_BRIDGE_VALUE_FLOAT) {
            state->packed_vertex_data[index] = (float)item->payload.float64;
        } else if (item->tag == KG_BRIDGE_VALUE_INTEGER) {
            state->packed_vertex_data[index] = (float)item->payload.integer;
        } else {
            kg_set_error(state->error_message, sizeof(state->error_message), "vertex data item %d is not numeric", (int)index);
            return false;
        }
    }
    return true;
}

static bool kg_load_ksl_assets(KGAppState *state) {
    char *asset_root;
    char *vertex_path;
    char *fragment_path;
    char *reflection_path;
    char *exe_dir = NULL;
    char *project_dir = NULL;
    char *fallback_root = NULL;
    bool ok;
    asset_root = kg_copy_string(state->shader_assets_dir);
    vertex_path = NULL;
    fragment_path = NULL;
    reflection_path = NULL;
    kg_trace("loading KSL assets dir='%s' shader='%s'", state->shader_assets_dir, state->shader_name);
retry_with_asset_root:
    free(vertex_path);
    free(fragment_path);
    free(reflection_path);
    vertex_path = kg_join_path3(asset_root, state->shader_name, ".vert.glsl");
    fragment_path = kg_join_path3(asset_root, state->shader_name, ".frag.glsl");
    reflection_path = kg_join_path3(asset_root, state->shader_name, ".reflection.json");
    if (vertex_path == NULL || fragment_path == NULL || reflection_path == NULL) {
        free(asset_root);
        free(exe_dir);
        free(project_dir);
        free(fallback_root);
        free(vertex_path);
        free(fragment_path);
        free(reflection_path);
        kg_set_error(state->error_message, sizeof(state->error_message), "out of memory while building KSL asset paths");
        return false;
    }
    state->loaded_vertex_source = kg_read_text_file(vertex_path, state->error_message, sizeof(state->error_message));
    if (state->loaded_vertex_source == NULL) {
        if (!kg_is_absolute_path(state->shader_assets_dir) && fallback_root == NULL) {
            exe_dir = kg_executable_dir();
            if (exe_dir != NULL) {
                project_dir = kg_dirname_owned(exe_dir);
                if (project_dir != NULL) {
                    fallback_root = kg_join_path2(project_dir, state->shader_assets_dir);
                    if (fallback_root != NULL && strcmp(fallback_root, asset_root) != 0) {
                        kg_trace("retrying KSL asset load with project-relative root '%s'", fallback_root);
                        free(asset_root);
                        asset_root = fallback_root;
                        fallback_root = NULL;
                        goto retry_with_asset_root;
                    }
                }
            }
        }
        free(asset_root);
        free(exe_dir);
        free(project_dir);
        free(fallback_root);
        free(vertex_path);
        free(fragment_path);
        free(reflection_path);
        return false;
    }
    kg_trace("loaded vertex glsl from '%s' (%zu bytes)", vertex_path, strlen(state->loaded_vertex_source));
    state->loaded_fragment_source = kg_read_text_file(fragment_path, state->error_message, sizeof(state->error_message));
    if (state->loaded_fragment_source == NULL) {
        free(vertex_path);
        free(fragment_path);
        free(reflection_path);
        return false;
    }
    kg_trace("loaded fragment glsl from '%s' (%zu bytes)", fragment_path, strlen(state->loaded_fragment_source));
    state->loaded_reflection_source = kg_read_text_file(reflection_path, state->error_message, sizeof(state->error_message));
    if (state->loaded_reflection_source == NULL) {
        free(vertex_path);
        free(fragment_path);
        free(reflection_path);
        return false;
    }
    kg_trace("loaded reflection from '%s' (%zu bytes)", reflection_path, strlen(state->loaded_reflection_source));
    free(vertex_path);
    free(fragment_path);
    free(reflection_path);
    free(asset_root);
    free(exe_dir);
    free(project_dir);
    free(fallback_root);

    {
        char *fixed_vertex = kg_fixup_glsl_source(state->loaded_vertex_source);
        char *fixed_fragment = kg_fixup_glsl_source(state->loaded_fragment_source);
        if (fixed_vertex == NULL || fixed_fragment == NULL) {
            free(fixed_vertex);
            free(fixed_fragment);
            kg_set_error(state->error_message, sizeof(state->error_message), "out of memory while applying GLSL compatibility fixups");
            return false;
        }
        free(state->loaded_vertex_source);
        free(state->loaded_fragment_source);
        state->loaded_vertex_source = fixed_vertex;
        state->loaded_fragment_source = fixed_fragment;
    }

    ok = kg_parse_reflection(&state->reflection, state->loaded_reflection_source, state->error_message, sizeof(state->error_message));
    if (!ok) {
        return false;
    }
    kg_trace("parsed reflection shader='%s' kind='%s' backend='%s' stages=%d resources=%d", state->reflection.shader_name, state->reflection.kind, state->reflection.backend, (int)state->reflection.stage_count, (int)state->reflection.resource_count);
    if (strcmp(state->reflection.shader_name, state->shader_name) != 0) {
        kg_set_error(
            state->error_message,
            sizeof(state->error_message),
            "reflection shader name mismatch: expected '%s' but the reflection describes '%s'",
            state->shader_name,
            state->reflection.shader_name
        );
        return false;
    }
    if (!kg_parse_vertex_layout(&state->layout, state->vertex_layout_text, state->error_message, sizeof(state->error_message))) {
        return false;
    }
    kg_trace("parsed vertex layout '%s' fields=%d stride=%d", state->vertex_layout_text, (int)state->layout.count, state->layout.stride_bytes);
    if (!kg_validate_reflection(&state->reflection, &state->layout, true, state->error_message, sizeof(state->error_message))) {
        return false;
    }
    kg_trace("reflection validated for runtime");
    if (!kg_pack_vertex_data(state)) {
        return false;
    }
    kg_trace("packed vertex data scalars=%zu", state->packed_vertex_scalar_count);
    free(state->vertex_source);
    free(state->fragment_source);
    state->vertex_source = kg_copy_string(state->loaded_vertex_source);
    state->fragment_source = kg_copy_string(state->loaded_fragment_source);
    kg_trace("copied runtime shader sources");
    return state->vertex_source != NULL && state->fragment_source != NULL;
}

static void kg_release_state(KGAppState *state) {
    if (state == NULL) {
        return;
    }
    kg_free_reflection(&state->reflection);
    kg_free_vertex_layout(&state->layout);
    free(state->title);
    free(state->vertex_source);
    free(state->fragment_source);
    free(state->shader_assets_dir);
    free(state->shader_name);
    free(state->vertex_layout_text);
    free(state->label);
    free(state->loaded_vertex_source);
    free(state->loaded_fragment_source);
    free(state->loaded_reflection_source);
    free(state->packed_vertex_data);
}

static void kg_fail_and_quit(KGAppState *state) {
    fprintf(stderr, "[kira-graphics] %s\n", state->error_message);
    fflush(stderr);
    sapp_request_quit();
}

static void kg_on_init(void *user_data) {
    KGAppState *state = (KGAppState *)user_data;
    sg_desc desc;
    sg_shader_desc shader_desc;
    sg_pipeline_desc pipeline_desc;

    memset(&desc, 0, sizeof(desc));
    desc.environment = sglue_environment();
    desc.logger.func = kg_sg_logger;
    kg_trace("sokol setup begin");
    sg_setup(&desc);
    kg_trace("sokol setup complete");

    memset(&shader_desc, 0, sizeof(shader_desc));
    shader_desc.vertex_func.source = state->vertex_source;
    shader_desc.fragment_func.source = state->fragment_source;
    shader_desc.label = state->label;
    kg_trace("shader desc prepared");

    if (state->shader_mode == 1) {
        size_t index;
        kg_trace("vertex entry='<glsl-main>'");
        for (index = 0; index < state->layout.count; index += 1) {
            char *glsl_name;
            size_t len = strlen("kira_attr_") + strlen(state->layout.fields[index].name) + 1;
            glsl_name = (char *)malloc(len);
            if (glsl_name == NULL) {
                kg_set_error(state->error_message, sizeof(state->error_message), "out of memory while building vertex attribute names");
                kg_fail_and_quit(state);
                return;
            }
            snprintf(glsl_name, len, "kira_attr_%s", state->layout.fields[index].name);
            shader_desc.attrs[index].glsl_name = glsl_name;
            shader_desc.attrs[index].base_type = state->layout.fields[index].base_type;
            kg_trace("attr[%d] glsl_name='%s' format=%d", (int)index, glsl_name, (int)state->layout.fields[index].vertex_format);
        }
        if (state->packed_vertex_scalar_count > 0) {
            sg_buffer_desc buffer_desc;
            memset(&buffer_desc, 0, sizeof(buffer_desc));
            buffer_desc.size = (size_t)state->packed_vertex_scalar_count * sizeof(float);
            buffer_desc.data.ptr = state->packed_vertex_data;
            buffer_desc.data.size = buffer_desc.size;
            buffer_desc.label = state->label;
            kg_trace("creating vertex buffer size=%llu", (unsigned long long)buffer_desc.size);
            state->vertex_buffer = sg_make_buffer(&buffer_desc);
            state->bindings.vertex_buffers[0] = state->vertex_buffer;
            state->has_vertex_buffer = true;
            kg_trace("created vertex buffer id=%u", state->vertex_buffer.id);
        }
    }

    kg_trace("creating shader");
    state->shader = sg_make_shader(&shader_desc);
    kg_trace("created shader id=%u", state->shader.id);
    {
        sg_shader_info shader_info = sg_query_shader_info(state->shader);
        kg_trace("shader slot state=%u", (unsigned)shader_info.slot.state);
        if (shader_info.slot.state != SG_RESOURCESTATE_VALID) {
            kg_set_error(state->error_message, sizeof(state->error_message), "shader creation failed; see sg logger output above");
            kg_fail_and_quit(state);
            return;
        }
    }
    memset(&pipeline_desc, 0, sizeof(pipeline_desc));
    pipeline_desc.shader = state->shader;
    pipeline_desc.label = state->label;
    if (state->shader_mode == 1 && state->layout.count > 0) {
        size_t index;
        pipeline_desc.layout.buffers[0].stride = state->layout.stride_bytes;
        for (index = 0; index < state->layout.count; index += 1) {
            pipeline_desc.layout.attrs[index].buffer_index = 0;
            pipeline_desc.layout.attrs[index].offset = state->layout.fields[index].offset_bytes;
            pipeline_desc.layout.attrs[index].format = state->layout.fields[index].vertex_format;
        }
    }
    kg_trace("creating pipeline");
    state->pipeline = sg_make_pipeline(&pipeline_desc);
    kg_trace("created pipeline id=%u", state->pipeline.id);
    {
        sg_pipeline_info pipeline_info = sg_query_pipeline_info(state->pipeline);
        if (pipeline_info.slot.state != SG_RESOURCESTATE_VALID) {
            kg_set_error(state->error_message, sizeof(state->error_message), "pipeline creation failed; see sg logger output above");
            kg_fail_and_quit(state);
            return;
        }
    }
    state->setup_ok = true;
}

static void kg_on_frame(void *user_data) {
    KGAppState *state = (KGAppState *)user_data;
    sg_pass pass;
    if (!state->setup_ok) {
        return;
    }
    memset(&pass, 0, sizeof(pass));
    pass.swapchain = sglue_swapchain();
    pass.action.colors[0].load_action = SG_LOADACTION_CLEAR;
    pass.action.colors[0].store_action = SG_STOREACTION_STORE;
    pass.action.colors[0].clear_value.r = state->clear_red;
    pass.action.colors[0].clear_value.g = state->clear_green;
    pass.action.colors[0].clear_value.b = state->clear_blue;
    pass.action.colors[0].clear_value.a = state->clear_alpha;
    sg_begin_pass(&pass);
    sg_apply_viewport(0, 0, sapp_width(), sapp_height(), true);
    sg_apply_pipeline(state->pipeline);
    if (state->has_vertex_buffer) {
        sg_apply_bindings(&state->bindings);
    }
    sg_draw(0, state->vertex_count, state->instance_count);
    sg_end_pass();
    sg_commit();
}

static void kg_on_cleanup(void *user_data) {
    KGAppState *state = (KGAppState *)user_data;
    if (state == NULL) {
        return;
    }
    if (state->vertex_buffer.id != 0) {
        sg_destroy_buffer(state->vertex_buffer);
    }
    if (state->pipeline.id != 0) {
        sg_destroy_pipeline(state->pipeline);
    }
    if (state->shader.id != 0) {
        sg_destroy_shader(state->shader);
    }
    sg_shutdown();
}

static bool kg_prepare_state(KGAppState *state) {
    memset(&state->bindings, 0, sizeof(state->bindings));
    kg_trace("prepare_state shader_mode=%d vertex_count=%d instance_count=%d", state->shader_mode, state->vertex_count, state->instance_count);
    if (state->vertex_count <= 0) {
        kg_set_error(state->error_message, sizeof(state->error_message), "vertex_count must be greater than zero");
        return false;
    }
    if (state->instance_count <= 0) {
        kg_set_error(state->error_message, sizeof(state->error_message), "instance_count must be greater than zero");
        return false;
    }
    if (state->shader_mode == 0) {
        kg_trace("using inline GLSL path");
        if (state->vertex_source == NULL || state->vertex_source[0] == '\0') {
            kg_set_error(state->error_message, sizeof(state->error_message), "inline scene is missing vertex_source");
            return false;
        }
        if (state->fragment_source == NULL || state->fragment_source[0] == '\0') {
            kg_set_error(state->error_message, sizeof(state->error_message), "inline scene is missing fragment_source");
            return false;
        }
        return true;
    }
    if (state->shader_mode == 1) {
        kg_trace("using KSL asset path");
        if (state->shader_assets_dir == NULL || state->shader_assets_dir[0] == '\0') {
            kg_set_error(state->error_message, sizeof(state->error_message), "KSL scene is missing shader_assets_dir");
            return false;
        }
        if (state->shader_name == NULL || state->shader_name[0] == '\0') {
            kg_set_error(state->error_message, sizeof(state->error_message), "KSL scene is missing shader_name");
            return false;
        }
        return kg_load_ksl_assets(state);
    }
    kg_set_error(state->error_message, sizeof(state->error_message), "unknown shader mode %d", state->shader_mode);
    return false;
}
#endif

static char *kg_inspect_failure(const char *message) {
    KGStringBuilder builder = {0};
    kg_sb_append(&builder, "status: error\nmessage: ");
    kg_sb_append(&builder, message);
    kg_sb_append(&builder, "\n");
    return kg_sb_take(&builder);
}

static char *kg_inspect_success(const KGReflection *reflection, const KGVertexLayoutSpec *layout, const char *runtime_status) {
    const KGStageInfo *vertex_stage = kg_find_stage(reflection, "vertex");
    const KGStageInfo *fragment_stage = kg_find_stage(reflection, "fragment");
    KGStringBuilder builder = {0};
    size_t index;
    kg_sb_append(&builder, "status: ok\n");
    kg_sb_appendf(&builder, "shader: %s\n", reflection->shader_name);
    kg_sb_appendf(&builder, "kind: %s\n", reflection->kind);
    kg_sb_appendf(&builder, "backend: %s\n", reflection->backend);
    if (vertex_stage != NULL) {
        kg_sb_appendf(&builder, "vertex_stage: %s (%s -> %s)\n", vertex_stage->entry, vertex_stage->input, vertex_stage->output);
    }
    if (fragment_stage != NULL) {
        kg_sb_appendf(&builder, "fragment_stage: %s (%s -> %s)\n", fragment_stage->entry, fragment_stage->input, fragment_stage->output);
    }
    kg_sb_appendf(&builder, "vertex_layout_fields: %d\n", (int)layout->count);
    for (index = 0; index < layout->count; index += 1) {
        kg_sb_appendf(&builder, "vertex_field[%d]: %s=%s offset=%d size=%d\n", (int)index, layout->fields[index].name, layout->fields[index].format_name, layout->fields[index].offset_bytes, layout->fields[index].size_bytes);
    }
    kg_sb_appendf(&builder, "resources: %d\n", (int)reflection->resource_count);
    for (index = 0; index < reflection->resource_count; index += 1) {
        kg_sb_appendf(
            &builder,
            "resource[%d]: %s.%s kind=%s binding=%d group_index=%d\n",
            (int)index,
            reflection->resources[index].group,
            reflection->resources[index].resource,
            reflection->resources[index].kind,
            reflection->resources[index].binding_index,
            reflection->resources[index].group_index
        );
    }
    kg_sb_appendf(&builder, "runtime: %s\n", runtime_status);
    return kg_sb_take(&builder);
}

static int64_t kg_write_report(char *report, int64_t code) {
    if (report != NULL && report[0] != '\0') {
        fputs(report, stdout);
    }
    fflush(stdout);
    free(report);
    return code;
}

#ifndef KG_NO_RUNTIME
KG_EXPORT void kira_graphics_run_app(
    const char *title,
    int64_t width,
    int64_t height,
    int64_t shader_mode,
    const char *vertex_source,
    const char *fragment_source,
    const char *shader_assets_dir,
    const char *shader_name,
    const char *vertex_layout,
    const KiraArray *vertex_data,
    int64_t vertex_count,
    int64_t instance_count,
    const char *label,
    float clear_red,
    float clear_green,
    float clear_blue,
    float clear_alpha
) {
    KGAppState *state = (KGAppState *)calloc(1, sizeof(KGAppState));
    sapp_desc desc;
    kg_trace(
        "run_app entered width=%d height=%d shader_mode=%d vertex_count=%d instance_count=%d clear=(%.3f, %.3f, %.3f, %.3f)",
        (int)width,
        (int)height,
        (int)shader_mode,
        (int)vertex_count,
        (int)instance_count,
        clear_red,
        clear_green,
        clear_blue,
        clear_alpha
    );
    if (state == NULL) {
        fprintf(stderr, "[kira-graphics] out of memory while allocating app state\n");
        fflush(stderr);
        return;
    }
    state->title = kg_copy_string(title);
    state->width = (int)width;
    state->height = (int)height;
    state->shader_mode = (int)shader_mode;
    state->vertex_source = kg_copy_string(vertex_source);
    state->fragment_source = kg_copy_string(fragment_source);
    state->shader_assets_dir = kg_copy_string(shader_assets_dir);
    state->shader_name = kg_copy_string(shader_name);
    state->vertex_layout_text = kg_copy_string(vertex_layout);
    state->vertex_data = vertex_data;
    state->vertex_count = (int)vertex_count;
    state->instance_count = (int)instance_count;
    state->label = kg_copy_string(label);
    state->clear_red = clear_red;
    state->clear_green = clear_green;
    state->clear_blue = clear_blue;
    state->clear_alpha = clear_alpha;
    kg_trace(
        "copied inputs title='%s' assets_dir='%s' shader='%s' layout='%s' vertex_data=%p len=%zu sizeof(KiraBridgeValue)=%zu",
        state->title != NULL ? state->title : "<null>",
        state->shader_assets_dir != NULL ? state->shader_assets_dir : "<null>",
        state->shader_name != NULL ? state->shader_name : "<null>",
        state->vertex_layout_text != NULL ? state->vertex_layout_text : "<null>",
        (void *)state->vertex_data,
        state->vertex_data != NULL ? state->vertex_data->len : 0,
        sizeof(KiraBridgeValue)
    );
    if (!kg_prepare_state(state)) {
        fprintf(stderr, "[kira-graphics] %s\n", state->error_message);
        fflush(stderr);
        kg_release_state(state);
        free(state);
        return;
    }
    memset(&desc, 0, sizeof(desc));
    desc.init_userdata_cb = kg_on_init;
    desc.frame_userdata_cb = kg_on_frame;
    desc.cleanup_userdata_cb = kg_on_cleanup;
    desc.user_data = state;
    desc.width = width;
    desc.height = height;
    desc.window_title = state->title;
    sapp_run(&desc);
    kg_release_state(state);
    free(state);
}
#endif

KG_EXPORT int64_t kira_graphics_inspect_ksl_asset(const char *shader_assets_dir, const char *shader_name, const char *vertex_layout) {
    KGReflection reflection;
    KGVertexLayoutSpec layout = {0};
    char *assets_dir = kg_copy_string(shader_assets_dir);
    char *name = kg_copy_string(shader_name);
    char *layout_text = kg_copy_string(vertex_layout);
    char *vertex_path = NULL;
    char *fragment_path = NULL;
    char *reflection_path = NULL;
    char *vertex_source = NULL;
    char *fragment_source = NULL;
    char *reflection_source = NULL;
    char error[512] = {0};
    bool ok = false;
    char *result;

    if (assets_dir == NULL || name == NULL || layout_text == NULL) {
        free(assets_dir);
        free(name);
        free(layout_text);
        return kg_write_report(kg_inspect_failure("out of memory while preparing inspection"), 1);
    }

    vertex_path = kg_join_path3(assets_dir, name, ".vert.glsl");
    fragment_path = kg_join_path3(assets_dir, name, ".frag.glsl");
    reflection_path = kg_join_path3(assets_dir, name, ".reflection.json");
    if (vertex_path == NULL || fragment_path == NULL || reflection_path == NULL) {
        free(assets_dir);
        free(name);
        free(layout_text);
        free(vertex_path);
        free(fragment_path);
        free(reflection_path);
        return kg_write_report(kg_inspect_failure("out of memory while building asset paths"), 1);
    }

    vertex_source = kg_read_text_file(vertex_path, error, sizeof(error));
    if (vertex_source == NULL) {
        result = kg_inspect_failure(error);
        goto cleanup;
    }
    fragment_source = kg_read_text_file(fragment_path, error, sizeof(error));
    if (fragment_source == NULL) {
        result = kg_inspect_failure(error);
        goto cleanup;
    }
    reflection_source = kg_read_text_file(reflection_path, error, sizeof(error));
    if (reflection_source == NULL) {
        result = kg_inspect_failure(error);
        goto cleanup;
    }
    ok = kg_parse_reflection(&reflection, reflection_source, error, sizeof(error));
    if (!ok) {
        result = kg_inspect_failure(error);
        goto cleanup;
    }
    if (strcmp(reflection.shader_name, name) != 0) {
        kg_set_error(error, sizeof(error), "reflection shader name mismatch: expected '%s' but found '%s'", name, reflection.shader_name);
        result = kg_inspect_failure(error);
        kg_free_reflection(&reflection);
        goto cleanup;
    }
    if (!kg_parse_vertex_layout(&layout, layout_text, error, sizeof(error))) {
        result = kg_inspect_failure(error);
        kg_free_reflection(&reflection);
        goto cleanup;
    }
    if (!kg_validate_reflection(&reflection, &layout, false, error, sizeof(error))) {
        result = kg_inspect_failure(error);
        kg_free_vertex_layout(&layout);
        kg_free_reflection(&reflection);
        goto cleanup;
    }
    if (reflection.resource_count > 0) {
        kg_set_error(error, sizeof(error), "ready_for_asset_loading_but_resource_binding_is_not_implemented (%s.%s)", reflection.resources[0].group, reflection.resources[0].resource);
    } else {
        kg_set_error(error, sizeof(error), "ready");
    }
    result = kg_inspect_success(&reflection, &layout, error);
    kg_free_vertex_layout(&layout);
    kg_free_reflection(&reflection);

cleanup:
    free(assets_dir);
    free(name);
    free(layout_text);
    free(vertex_path);
    free(fragment_path);
    free(reflection_path);
    free(vertex_source);
    free(fragment_source);
    free(reflection_source);
    return kg_write_report(result, result != NULL && strstr(result, "status: ok") != NULL ? 0 : 1);
}
