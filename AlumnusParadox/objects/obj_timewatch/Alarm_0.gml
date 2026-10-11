
//checking on timer
if (total_seconds <= 0) {
	total_loops++;
	room_restart()
	total_seconds = 180;
	alarm[0] = game_get_speed(gamespeed_fps)
}
else {
	total_seconds -= 1;
	alarm[0] = game_get_speed(gamespeed_fps)
}