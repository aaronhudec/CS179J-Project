// Returns to the main menu if both start and select are hit at the same time
if (keyboard_check(vk_shift) && keyboard_check_pressed(vk_enter)) {
	audio_stop_all();
    room_goto(Menu_Main);
}