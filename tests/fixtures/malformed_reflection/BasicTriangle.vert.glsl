#version 330 core
layout(location = 0) in vec2 kira_attr_position;
void main() {
    gl_Position = vec4(kira_attr_position, 0.0, 1.0);
}
