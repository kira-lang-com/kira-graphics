#version 330 core

struct VertexIn {
    vec3 position;
    vec3 normal;
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

FragmentOut LifetimeStress__fragment__entry(VertexOut kira_stage_input) {
    FragmentOut result;
    result.color = kira_stage_input.color;
    return result;
}

void main() {
    VertexOut kira_input;
    kira_input.color = kira_varying_color;
    FragmentOut kira_output = LifetimeStress__fragment__entry(kira_input);
    kira_frag_color = kira_output.color;
}
