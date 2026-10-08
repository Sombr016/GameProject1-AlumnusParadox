/// @description Spritesetting

//Update player sprites while the player's in the walking state
if state == States.regular /* TODO: check that 'state' has an appropriate value here (replace false) */ {
	if vspeed > 0 {
		sprite_index = spr_player_run_down	
	} else if vspeed < 0 {
		sprite_index = spr_player_run_up	
	} else if hspeed < 0 {
		sprite_index = spr_player_run_left
	} else if hspeed > 0 {
		sprite_index = spr_player_run_right
	}
}


//animation freezes in place if you're not dancing and not moving
if state == States.regular /* TODO: check that 'state' has an appropriate value here (replace false) */
	&& (vspeed = 0 and hspeed = 0) {
	image_speed = 0	
} else {
	image_speed = 1	
}