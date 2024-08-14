/// @description Insert description here
// You can write your code in this editor
gpu_set_blendenable(false);

if (pause) {
	surface_set_target(application_surface);
	if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
	
	else {
		pauseSurf = surface_create(320, 280);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	surface_reset_target();
}

//|| (pauseOptionSelected == 0 && keyboard_check_pressed(ord("A"))
if (keyboard_check_pressed(vk_enter)) {
	if (!pause) {
		pause = true;
		
		instance_deactivate_all(true);
		audio_pause_all();
		
		pauseSurf = surface_create(320, 280);
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(320 * 280 * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);


	}
	
	else if (pause && pauseOptionSelected == 0){
		pause = false;
		
		
		instance_activate_all();
		audio_resume_all();
		
		if (!global.activate_test_mode) {
			instance_deactivate_object(test_mode_auto_play);
		}
		
		if (surface_exists(pauseSurf)) {
			surface_free(pauseSurf);
		}
		
		if (buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);
		}
	}
}

gpu_set_blendenable(true);
		