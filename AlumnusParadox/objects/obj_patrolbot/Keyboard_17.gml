//Debug values to increase certain variables.
if(debug) {
	if(keyboard_check_pressed(ord("E"))) {
		vision_distance += 50
	}
	if(keyboard_check_pressed(ord("T"))) {
		vision_spread += 10
	}
	if(keyboard_check_pressed(ord("Y"))) {
		triangle_segments++;
	}
}
