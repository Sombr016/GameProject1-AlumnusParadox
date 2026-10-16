// If the player dies, fade the screen to black.
if(isPlayerDead) {
	draw_set_alpha(blackScreenOpacity);
    draw_rectangle_color(-1,-1,display_get_gui_width()+1,display_get_gui_height()+1,c_black,c_black,c_black,c_black,false);
    draw_set_alpha(1);
	blackScreenOpacity += 1/screenfadetime;
}