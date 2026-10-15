if(state == PatrolState.patrol) {
	image_xscale = 0.5;
	image_yscale = 0.5;
	if(direction < 45) {
		sprite_index = spr_patrol_right;
	}
	else if (direction < 135) {
		sprite_index = spr_patrol_away;
	}
	else if (direction < 205) {
		sprite_index = spr_patrol_left;
	}
	else if (direction < 295) {
		sprite_index = spr_patrol_forward;
	}
	else {
		sprite_index = spr_patrol_right;
	}
}
