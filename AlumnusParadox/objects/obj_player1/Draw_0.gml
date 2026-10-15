/// @description Shader stuff (I'm so scared)
if(state = States.death) {
shader_set(player_rift_pull);
_color = [1,0,0,1]
shader_set_uniform_f_array(_uniColor, _color);
}
draw_self();
shader_reset();
//draw_text(x,y-40,"Direction: "+string(direction));