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

layout(location = 0) in vec3 kira_attr_position;
layout(location = 1) in vec3 kira_attr_normal;
out vec4 kira_varying_color;

VertexOut LifetimeStress__vertex__entry(VertexIn input) {
    VertexOut result;
    result.clip_position = vec4(input.position, 1);
    result.color = vec4(input.normal.x, input.normal.y, input.normal.z, 1);
    return result;
}

void main() {
    VertexIn kira_input;
    kira_input.position = kira_attr_position;
    kira_input.normal = kira_attr_normal;
    VertexOut kira_output = LifetimeStress__vertex__entry(kira_input);
    gl_Position = kira_output.clip_position;
    kira_varying_color = kira_output.color;
}
