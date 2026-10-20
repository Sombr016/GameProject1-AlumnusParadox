// If the player dies, fade the screen to black.
if(isPlayerDead) {
	show_debug_message(string(gameOverOpacity));
	draw_set_alpha(blackScreenOpacity);
    draw_rectangle_color(-1,-1,room_width+1,room_height+1,c_black,c_black,c_black,c_black,false);
    draw_set_alpha(1);
	if(blackScreenOpacity >= 1) {
		blackScreenOpacity = 1;
		if(alarm[1] < 0) {
			alarm[1] = restart_time;
		}
		//draw_sprite(spr_GameOver_text,0,0,display_get_gui_height()/2);
	}
	else {
	blackScreenOpacity += 1/screenfadetime;
	}
	
}