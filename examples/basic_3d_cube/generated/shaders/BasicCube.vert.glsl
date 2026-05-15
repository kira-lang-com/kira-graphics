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

layout(location = 0) in vec3 kira_attr_position;
layout(location = 1) in vec3 kira_attr_normal;
out vec3 kira_varying_worldNormal;
out vec3 kira_varying_worldPosition;
out vec4 kira_varying_color;

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

VertexOut BasicCube__vertex__entry(VertexIn vertexIn) {
    VertexOut result;
    vec4 worldPosition = (object.model * vec4(vertexIn.position, 1));
    result.clip_position = (scene.viewProjection * worldPosition);
    result.worldPosition = vec3(worldPosition.x, worldPosition.y, worldPosition.z);
    vec4 normal4 = (object.model * vec4(vertexIn.normal, 0));
    result.worldNormal = normalize(vec3(normal4.x, normal4.y, normal4.z));
    result.color = object.baseColor;
    return result;
}

void main() {
    VertexIn kira_input;
    kira_input.position = kira_attr_position;
    kira_input.normal = kira_attr_normal;
    VertexOut kira_output = BasicCube__vertex__entry(kira_input);
    gl_Position = kira_output.clip_position;
    kira_varying_worldNormal = kira_output.worldNormal;
    kira_varying_worldPosition = kira_output.worldPosition;
    kira_varying_color = kira_output.color;
}
