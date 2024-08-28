if (pause) {
	var keyUp = keyboard_check_pressed(vk_up);
	var keyDown = keyboard_check_pressed(vk_down);
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) - 1; 
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("A"))) {
		switch (pauseOptionSelected) {
			case 1: {
				game_restart();
			}
			break;
			
			case 2: {
				game_end();
			}
		}
	}
}