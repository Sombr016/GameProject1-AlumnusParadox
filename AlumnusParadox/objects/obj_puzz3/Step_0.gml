if (guiShown) {
	if(solved && instance_exists(obj_door)){
			instance_destroy(obj_door)
	}
	
	if (typing)
	{
		userGuess = keyboard_string;
		// Remove the last character with Backspace
		if (keyboard_check_pressed(vk_backspace))
		{
			if (userGuess != "")
		    {
		        userGuess = string_delete(
		            userGuess,
		            string_length(userGuess),
		            1
					);
		     }
		}
	
		// Submit using Enter
		if (keyboard_check_pressed(vk_enter))
		{
			userGuess = keyboard_string;
			if (string_trim(userGuess) == answer)
			{
				feedbackMsg = "Correct! You solved the puzzle. Press ESC to exit";
		    }
		    else
		    {
				feedbackMsg = "Incorrect. Try again!";
		    }
		}
		// Close the GUI by pressing Escape
		
	}
	//Close menu when player moves
	if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_down))
		{
			guiShown = false;
		}
}