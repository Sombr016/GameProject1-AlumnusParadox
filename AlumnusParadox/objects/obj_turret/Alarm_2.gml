//STATE SEARCH -> SENTRY
state = TurretStates.sentry;
target = noone;
//Recalculate the min and max rotation in correspondence to the
//Starting direction and the total rotation.
min_rotation = starting_direction - (total_rotation/2);
max_rotation = starting_direction + (total_rotation/2);

if(min_rotation < 0) {
	min_rotation = 360+min_rotation
}
if(max_rotation >= 360) {
	max_rotation = (max_rotation-360)
}
//Round direction up for a better calculation.
direction = round(direction);

if(direction > max_rotation || direction < min_rotation) {
	//show_debug_message("Reverse Disabled.");
	disableReverse = true;
}
//Take the beam length back to the default state.
beam_length -= 50;
beam_length -= 50;