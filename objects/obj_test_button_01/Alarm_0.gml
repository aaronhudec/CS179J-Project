// Simulate pressing all keys
keyboard_key_press(vk_left);
keyboard_key_press(vk_up);
keyboard_key_press(vk_down);
keyboard_key_press(vk_right);
keyboard_key_press(ord("A"));
keyboard_key_press(ord("B"));
global.test_score += 6; // Increase the expected test score value
show_debug_message("Pressed all keys");

alarm[1] = 4; // Wait x steps to next alarm, which will release keys
