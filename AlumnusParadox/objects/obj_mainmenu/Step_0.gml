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