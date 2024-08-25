/// @description Insert description here
// You can write your code in this editor

show_debug_message(y)
// if the note is hit between y = 178 and y = 190 -> perfect
// otherwise, okay
// if note passes the bottom screen, miss
if (y > 173 && y < 190) {
	particle_spawner.draw_burst(x,y);
	global.score += 100;
	++global.score_perfect; 
} else if (y > room_height){
	global.score -= 10;
	++global.score_miss;
} else {
	particle_spawner.draw_burst(x,y);
	global.score += 1;
	++global.score_ok;
}