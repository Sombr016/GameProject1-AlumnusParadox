if (keyboard_check_pressed(vk_anykey)) {
    if (keyboard_lastkey == code1[code1_pos]) {
        code1_pos++;
        if (code1_pos >= array_length(code1)) {
            // Cheat triggered
			room_goto(rmd_test);
            code1_pos = 0;
        }
    } else {
        code1_pos = 0;
    }
}
if(keyboard_check(vk_alt) && keyboard_check_pressed(ord("C"))) {
	creditsFlag = !creditsFlag;
}


if(creditsFlag) {
	if(instance_exists(obj_startButton)) {
		obj_startButton.image_alpha = 0;
	}
	if(instance_exists(obj_creditsButton)) {
		obj_creditsButton.image_alpha = 1;
	}
}
else {
	if(instance_exists(obj_startButton)) {
		obj_startButton.image_alpha = 1;
	}
	if(instance_exists(obj_quitButton)) {
		obj_quitButton.image_alpha = 1;
	}
}