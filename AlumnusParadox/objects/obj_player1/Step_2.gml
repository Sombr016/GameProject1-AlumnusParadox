/// @description Spritesetting

//Update player sprites while the player's in the walking state
if state == States.regular || state == States.pushing {
	if vspeed > 0 {
		sprite_index = spr_player_run_down	
	} else if vspeed < 0 {
		sprite_index = spr_player_run_up	
	} else if hspeed < 0 {
		sprite_index = spr_player_run_left
	} else if hspeed > 0 {
		sprite_index = spr_player_run_right
	} else if (hspeed == 0 && vspeed == 0){
		sprite_index = spr_player_idle
	}
}

//Its the death state.
if state == States.death {
	sprite_index = spr_player_idle;
	if(deathtimer <= 0) {
		deathtimer = 150
		room_restart();
	}
}