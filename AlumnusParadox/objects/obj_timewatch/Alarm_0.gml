/// @description Checks if timer runs out. If so, perform some operations.
//checking on timer
if (total_seconds <= 0) {
	if(isPlayerDead) {
		
	}
	else {
		total_seconds = timeloopduration;
		room_restart();
		alarm[0] = game_get_speed(gamespeed_fps);
	}
}
else {
	total_seconds -= 1;
	alarm[0] = game_get_speed(gamespeed_fps)
}