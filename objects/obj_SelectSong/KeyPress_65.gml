/// @description Insert description here
// You can write your code in this editor
if(obj_SelectSong.x == 160 && obj_SelectSong.y == 96 ) {
	if (obj_Difficulty.image_index == 1) {	
		room_goto(Infraction_NTOO_Normal);
	}
	else if (obj_Difficulty.image_index == 0) {
		room_goto(Menu);
	}
}

else if(obj_SelectSong.x == 160 && obj_SelectSong.y == 192) {
	room_goto(Menu);
}