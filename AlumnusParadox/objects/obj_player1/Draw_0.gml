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
//If the time remaining is less than 5 seconds, make the player slowly fade into blue.
else if(object_exists(obj_timewatch)) {
	if(obj_timewatch.total_seconds <= 5) {
		shader_set(player_rift_pull);
		_color = [0,0,1,1];
		_teleportOpacity += (0.002);
		shader_set_uniform_f_array(_uniColor, _color);
		shader_set_uniform_f(_uniMix, _teleportOpacity);
		draw_self();
		shader_reset();
	}
}
//draw_text(x,y-40,"Direction: "+string(direction));