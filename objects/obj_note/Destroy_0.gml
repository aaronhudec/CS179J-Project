/// @description Insert description here
// You can write your code in this editor

show_debug_message(y)
// if the note is hit between y = 178 and y = 188 -> perfect
// otherwise, okay
// if note passes the bottom screen, miss
if (y > 165 && y < 180) {
	global.score += 100;
} else if (y > room_height){
	global.score -= 10;
} else {
	global.score += 1;
}