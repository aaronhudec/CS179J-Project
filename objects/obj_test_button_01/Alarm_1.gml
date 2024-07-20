// Release all keys
keyboard_key_release(vk_left);
keyboard_key_release(vk_up);
keyboard_key_release(vk_down);
keyboard_key_release(vk_right);
keyboard_key_release(ord("A"));
keyboard_key_release(ord("B"));
show_debug_message("Released all keys");

alarm[2] = 1; // Wait until the test check
