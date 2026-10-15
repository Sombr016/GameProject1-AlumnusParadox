/// @description Fullscreen + Player Cheat Codes
//	This code provides a keyboard shortcut to toggle between full and windowed screen.
if (keyboard_check(vk_alt) && (keyboard_check_pressed(ord("F"))))
{
	if window_get_fullscreen()
		window_set_fullscreen(false);
	else
		window_set_fullscreen(true);
}


// This statement checks if a specific string of characters/numbers/operators were pressed in a row.
// If this is true, then trigger the cheat.
if (keyboard_check_pressed(vk_anykey)) {
    if (keyboard_lastkey == code1[code1_pos]) {
        code1_pos++;
        if (code1_pos >= array_length(code1)) {
            // Cheat triggered
			walkSpeed += 1
            code1_pos = 0;
        }
    } else {
        code1_pos = 0;
    }
	if (keyboard_lastkey == code2[code2_pos]) {
        code2_pos++;
        if (code2_pos >= array_length(code2)) {
            // Cheat triggered
			if(isInvulnerable) {
				isInvulnerable = false;
			}
			else {
				isInvulnerable = true;
			}
            code2_pos = 0;
        }
    } else {
        code2_pos = 0;
    }
}