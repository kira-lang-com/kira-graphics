#version 330 core

struct VertexIn {
    vec3 position;
    vec3 normal;
};

struct ObjectUniforms {
    mat4 model;
    vec4 baseColor;
};

struct FragmentOut {
    vec4 color;
};

struct VertexOut {
    vec4 clip_position;
    vec3 worldNormal;
    vec3 worldPosition;
    vec4 color;
};

struct SceneUniforms {
    mat4 viewProjection;
    vec4 lightDirection;
    vec4 lightColor;
};

layout(std140) uniform scene_Block {
    mat4 viewProjection;
    vec4 lightDirection;
    vec4 lightColor;
} scene;

layout(std140) uniform object_Block {
    mat4 model;
    vec4 baseColor;
} object;

in vec3 kira_varying_worldNormal;
in vec3 kira_varying_worldPosition;
in vec4 kira_varying_color;
layout(location = 0) out vec4 kira_frag_color;

float saturate(float value) {
    if ((value < 0)) {
        return 0;
    }
    if ((value > 1)) {
        return 1;
    }
    return value;
}

float absolute(float value) {
    if ((value < 0)) {
        return (0 - value);
    }
    return value;
}

FragmentOut BasicCube__fragment__entry(VertexOut input) {
    FragmentOut result;
    vec3 n = normalize(input.worldNormal);
    result.color = vec4(absolute(n.x), absolute(n.y), absolute(n.z), input.color.w);
    return result;
}

void main() {
    VertexOut kira_input;
    kira_input.worldNormal = kira_varying_worldNormal;
    kira_input.worldPosition = kira_varying_worldPosition;
    kira_input.color = kira_varying_color;
    FragmentOut kira_output = BasicCube__fragment__entry(kira_input);
    kira_frag_color = kira_output.color;
}
