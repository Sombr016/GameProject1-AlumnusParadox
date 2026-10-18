if (guiShown) {
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);

	//Draw input background
	recx1 = inputX-460
	recy1 = inputY-240
	recx2 = recx1+1150
	recy2 = recy1+700
	offset = 30
	
	draw_set_color(c_white);
	draw_rectangle(
		recx1, recy1,
	    recx2,recy2,
	    false
	);
	
	draw_set_color(c_black);
	draw_rectangle(
		recx1+offset, recy1+offset,
	    recx2-offset, recy2-offset,
	    false
	);
	
	// Draw question
	draw_set_color(c_ltgray);
	draw_text(inputX+150, inputY - 25, question2Player);

	// Draw input box
	draw_set_color(c_ltgray);
	draw_rectangle(
	    inputX, inputY,
	    inputX + inputW, inputY + inputH,
	    false
	);

	// Draw the user's typed guess
	draw_set_color(c_black);
	draw_text(inputX + 130, inputY + 10, keyboard_string);

	// Draw feedback
	draw_set_color(c_aqua);
	draw_text(inputX+120, inputY+45, feedbackMsg);


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
	if(keyboard_check_pressed(vk_up)){
		guiShown = false
	}
	

	if (keyboard_check_pressed(vk_enter)) {
		userGuess += keyboard_string
		if (string_trim(userGuess) == answer) {
			feedbackMsg = "Accepted! Door is open"
			userGuess = ""
			solved = true
		}
		else {
			feedbackMsg = "Incorrect! Please try again"
			userGuess =  ""
		
		}

	}
}
