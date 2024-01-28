shader_type canvas_item;

void fragment() {
    vec2 shifteduv = UV;
    shifteduv .y += TIME * 1.0;
    vec4 color = texture(TEXTURE, shifteduv);
    COLOR = color;
}