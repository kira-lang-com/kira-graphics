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

in vec4 kira_varying_color;
layout(location = 0) out vec4 kira_frag_color;

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

FragmentOut UiDemo__fragment__entry(VertexOut input) {
    FragmentOut result;
    result.color = input.color;
    return result;
}

void main() {
    VertexOut kira_input;
    kira_input.color = kira_varying_color;
    FragmentOut kira_output = UiDemo__fragment__entry(kira_input);
    kira_frag_color = kira_output.color;
}
