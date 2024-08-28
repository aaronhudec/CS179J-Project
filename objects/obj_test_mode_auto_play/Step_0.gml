// Release buttons each frame, if any were pressed in previous frame by the if statements
keyboard_key_release(vk_left);
keyboard_key_release(vk_up);
keyboard_key_release(vk_down);
keyboard_key_release(vk_right);
keyboard_key_release(ord("A"));
keyboard_key_release(ord("B"));

// Check collision for the Left button
if (collision_point(x_left, obj_leftButton.bbox_top, obj_note_blue, false, true) != noone) {
    keyboard_key_press(vk_left);
}

// Check collision for the Down button
if (collision_point(x_down, obj_downButton.bbox_top, obj_note_blue, false, true) != noone) {
    keyboard_key_press(vk_down);
}

// Check collision for the Up button
if (collision_point(x_up, obj_upButton.bbox_top, obj_note_blue, false, true) != noone) {
    keyboard_key_press(vk_up);
}

// Check collision for the Right button
if (collision_point(x_right, obj_rightButton.bbox_top, obj_note_blue, false, true) != noone) {
    keyboard_key_press(vk_right);
}

// Check collision for the A button
if (collision_point(x_a, obj_aButton.bbox_top, obj_note, false, true) != noone) {
    keyboard_key_press(ord("B"));
}

// Check collision for the B button
if (collision_point(x_b, obj_bButton.bbox_top, obj_note, false, true) != noone) {
    keyboard_key_press(ord("A"));
}
