if (time == 0) {
	
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0, 320, 240, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(FontDroidSansMono);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(160, 50, "Total Score: " + string(global.score));
	draw_text(160, 96, "Perfect Hits: " + string(global.score_perfect));
	draw_text(160, 128, "Ok Hits: " + string(global.score_ok));
	draw_text(160, 160, "Total Misses: " + string(global.score_miss));

}