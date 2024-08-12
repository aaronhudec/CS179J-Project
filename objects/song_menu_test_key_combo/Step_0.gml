// Go to the test song room when a key combo is pressed pressed
if (keyboard_check(vk_left) && keyboard_check_pressed(vk_right)) {
	if (global.activate_test_mode) {
		global.activate_test_mode = false;
		image_index = 0;
	}
	else
	{
		global.activate_test_mode = true;
		image_index = 1;
	}
}