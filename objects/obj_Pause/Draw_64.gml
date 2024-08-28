/// @description Insert description here
// You can write your code in this editor
if (pause) {
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0, 320, 240, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(FontDroidSansMono);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(160, 32, "Pause");


	for (var i = 0; i < array_length(pauseOption); ++i) {
		var _print = "";
		if (i == pauseOptionSelected) {
			_print += "> " + pauseOption[i] + " <";
		}
		else {
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(160,96 + (i *32), _print); 
		draw_set_alpha(1.0);
	}
}

