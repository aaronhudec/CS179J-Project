if (time == 0 && !pause) {
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