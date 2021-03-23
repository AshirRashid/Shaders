shader_type canvas_item;

const float PI = 3.14159265359;

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 center = vec2(0.5, 0.5);

float moving_line(vec2 pos, float t, float m, float c_offset, float width, float s) {
	//returns if a certain point(pos) is a part of the line or not. 1 if it is, 0 if it's not.
	//pos: position, t: time, m: gradient, c_offset: inital y-intercept
	//s: speed
	pos.x *= m;
	float c = mod(t, 3.5/s)*s - c_offset;// my favourite part of the shader. c is the final y-intercept of the line.
	pos.x += c;
	return 1.0 - step(width/2.0, abs(pos.x - pos.y));
}

void fragment() {
    vec2 pos = UV;
	vec4 texture_color = texture(TEXTURE, UV);
	vec3 shine_color = vec3(1) * moving_line(pos, TIME, 1, 2, 0.3, 3);
    COLOR = vec4(shine_color+texture_color.xyz,texture_color.a);
}
