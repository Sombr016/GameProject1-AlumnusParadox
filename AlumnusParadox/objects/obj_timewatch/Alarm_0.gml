
//checking on timer
if (total_seconds <= 0) {
	room_restart()
}
else {
	total_seconds -= 1;
	alarm[0] = game_get_speed(gamespeed_fps)
}