if (guiShown) {
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);

	// Draw question
	draw_text(250, 155, question2Player);

	// Draw input box
	draw_set_color(c_ltgray);
	draw_rectangle(
	    inputX, inputY,
	    inputX + inputW, inputY + inputH,
	    false
	);

	// Draw the user's typed guess
	draw_set_color(c_black);
	draw_text(inputX + 30, inputY + 10, keyboard_string);

	// Draw feedback
	draw_set_color(c_aqua);
	draw_text(235, 225, feedbackMsg);


	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	// Click inside the input field
	if (mx >= inputX && mx <= inputX + inputW
	&& my >= inputY && my <= inputY + inputH)
	{
	    typing = true;
	}

	// Click outside the input field
	else
	{
	    typing = false;
	}

	if (keyboard_check_pressed(vk_enter)) {
		userGuess += keyboard_string
		if (string_trim(userGuess) == answer) {
			feedbackMsg = "Correct! You solved the puzzle"
			userGuess = ""
		}
		else {
			feedbackMsg = "Incorrect! Please try again"
			userGuess =  ""
		
		}

	}
}
