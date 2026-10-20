if(keyboard_check_pressed(ord("O"))) {
	total_seconds = 0;
	alarm[0] = 1;
}
if(keyboard_check_pressed(ord("R"))) {
global.riftsCompleted += 1
}
if(keyboard_check_pressed(ord("U"))) {
drawUI = !drawUI
}

if(keyboard_check_pressed(ord("C"))){
	obj_player1.visible = !obj_player1.visible;
}

if(keyboard_check_pressed(ord("S"))){
	audio_stop_all()
}
if(keyboard_check_pressed(ord("T"))) {
	total_seconds = 9999999;
	alarm[0] = 1;
}
if(keyboard_check_pressed(ord("B"))) {
	instance_destroy(obj_door)
}
