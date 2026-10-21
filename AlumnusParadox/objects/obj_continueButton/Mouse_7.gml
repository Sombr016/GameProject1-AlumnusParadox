if(instance_exists(obj_timewatch)) {
	obj_timewatch.alarm[1] = 1;
}
else {
	show_debug_message("Obj_Timewatch doesn't exist. That shouldn't occur here.");
}
obj_timewatch.game_over_button = noone;
instance_destroy();