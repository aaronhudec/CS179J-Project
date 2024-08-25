time = 0;
pauseSurf = -1;
pauseSurfBuffer = -1;
pause = false;


//time is set to the length of the song + a couple of seconds as a bit of a buffer
if (room == Infraction_NTOO_Easy || room == Infraction_NTOO_Normal) {
	time = 110;
}

else {
	time = 114;
}

//Alarm goes off every 60 frames
//**Can be tied to fps, but only seems to work sometimes
alarm[0] = 60;