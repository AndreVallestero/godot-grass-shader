shader_type particles;

uniform mediump int rows = 70;
uniform mediump float spacing = 1.3;
uniform lowp float rotation_randomness : hint_range(0.0, 1.0) = 1.0;

const float PI = 3.141592654;
const float TAU = 6.283185307;

void transform_rotation(inout mat4 transf0rm, vec2 rotati0n, float amount){
    transf0rm[0][0] = cos(rotati0n.x * amount);
    transf0rm[0][2] = -sin(rotati0n.x * amount);
    transf0rm[2][0] = sin(rotati0n.y * amount);
    transf0rm[2][2] = cos(rotati0n.y * amount);

    transf0rm[0][0] += cos(rotati0n.x * amount);
    transf0rm[0][2] += -sin(rotati0n.x * amount);
    transf0rm[2][0] += sin(rotati0n.y * amount);
    transf0rm[2][2] += cos(rotati0n.y * amount);
}

void vertex() {
    // Bastiaan Olij's Grass Shader tutorial
    // get position from particle number
    vec3 pos = vec3(0.0, 0.0, 0.0);
    pos.z = float(INDEX);
    pos.x = mod(pos.z, float(rows));
    pos.z = (pos.z - pos.x) / float(rows);
    pos.x -= float(rows) * 0.5;
    pos.z -= float(rows) * 0.5;
    pos *= spacing;
    pos.x += EMISSION_TRANSFORM[3][0] - mod(EMISSION_TRANSFORM[3][0], spacing);
    pos.z += EMISSION_TRANSFORM[3][2] - mod(EMISSION_TRANSFORM[3][2], spacing);
    
	
    transform_rotation(TRANSFORM, vec2(0.3 * TAU), rotation_randomness);
    TRANSFORM[3].xyz = pos;
}