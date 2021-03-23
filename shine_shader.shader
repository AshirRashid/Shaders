shader_type canvas_item;

const float PI = 3.14159265359;

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 center = vec2(0.5, 0.5);

void fragment() {
    vec2 st = UV;
	vec4 texture_color = texture(TEXTURE, UV);

    st.x = st.x + 3.0*mod(TIME, 2.0) - 2.0;
    float init_color = 1.0 - step(0.2, abs(st.y-st.x));
	
	texture_color.xyz = texture_color.xyz * (1.0-init_color);
	vec3 shine_color = vec3(0.780392, 0.941176, 0.847059) * init_color;
    COLOR = vec4(shine_color+texture_color.xyz,texture_color.a);
}
void vertex() {
	VERTEX.y += sin(5.0*TIME);
}