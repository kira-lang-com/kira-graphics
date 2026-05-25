#version 330 core

struct VertexIn {
    vec2 position;
};

struct FragmentOut {
    vec4 color;
};

struct VertexOut {
    vec4 clip_position;
    vec4 color;
};

layout(location = 0) in vec2 kira_attr_position;
out vec4 kira_varying_color;

vec4 uiColor(vec2 position) {
    if ((position.y > 0)) {
        if ((position.y < 0.2)) {
            return vec4(0.78, 0.86, 0.94, 1);
        }
    }
    if ((position.y > -0.2)) {
        if ((position.y < 0)) {
            return vec4(0.47, 0.58, 0.7, 1);
        }
    }
    return vec4(0.16, 0.22, 0.3, 1);
}

VertexOut UiDemo__vertex__entry(VertexIn kira_stage_input) {
    VertexOut result;
    result.clip_position = vec4(kira_stage_input.position, 0, 1);
    result.color = uiColor(kira_stage_input.position);
    return result;
}

void main() {
    VertexIn kira_input;
    kira_input.position = kira_attr_position;
    VertexOut kira_output = UiDemo__vertex__entry(kira_input);
    gl_Position = kira_output.clip_position;
    kira_varying_color = kira_output.color;
}
