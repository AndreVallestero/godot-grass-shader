shader_type spatial;
render_mode cull_disabled;
uniform sampler2D texture_albedo : hint_albedo;
uniform float alpha_scissor_threshold;

void vertex() {
	// See reference spatial shader, can do all the vertex effects here
}

void fragment() {
	vec4 albedo_tex = texture(texture_albedo, UV);
	
	ALBEDO = albedo_tex.rgb;
	ALPHA = albedo_tex.a;
	ALPHA_SCISSOR = alpha_scissor_threshold;
}
