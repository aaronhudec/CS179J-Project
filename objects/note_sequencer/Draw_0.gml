// Draw "Get ready!" message for the first 3 seconds
if (alarm[0] > 0) {
    draw_set_font(FontDroidSansMono);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width / 2, room_height / 2, "Get ready!");
}