if(instance_exists(obj_player1)) {
	isPlayerDead = obj_player1.isDead;
}

//The event in which the obj_timewatch instance needs to be destroyed. Use CAREFULLY.
if(room_get_name(room) != "rmd_main") {
	show_debug_message("Deleted obj_timewatch. You sure you know what you're doing?");
	show_debug_message("This statement is contained within obj_timewatch's step event, line 6->10.");
	instance_destroy();
}