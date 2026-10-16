/// @description Shader stuff (I'm so scared)
draw_self();
if(state = States.death) {
	shader_set(player_rift_pull);
	_color = [1,0,0,1]
	shader_set_uniform_f_array(_uniColor, _color);
	shader_set_uniform_f(_uniMix, _shaderOpacity);
	draw_self();
	shader_reset();
}
//draw_text(x,y-40,"Direction: "+string(direction));