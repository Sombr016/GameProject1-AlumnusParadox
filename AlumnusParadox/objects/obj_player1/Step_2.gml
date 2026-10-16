/// @description Spritesetting

//Update player sprites while the player's in the walking state
if state == States.regular || state == States.pushing {
	image_xscale = 0.75
	image_yscale = 0.75
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
	if (vspeed != 0 || hspeed != 0) {
		audio_listener_position(x, y, 0);
		audio_listener_orientation(0, 0, 1, lengthdir_x(1, direction), lengthdir_y(1, direction), 0);
	}
}

//Its the death state.
if state == States.death {
	sprite_index = spr_player_idle;
	if(_shaderOpacity < 1) { _shaderOpacity += (1/deathtimer)}
	if(deathtimer <= 0) {
		deathtimer = 150;
		if(instance_exists(obj_timewatch)) {
			obj_timewatch.total_seconds = 1;
		}
		else {
			room_restart();
		}
	}
}