/// @description spawns note particles
// You can write your code in this editor
depth = -1;


_ps_blue = part_system_create(particle_blue);
_ps_red = part_system_create(particle_red);

#region Function

function draw_burst(xpos, ypos) {
	if (xpos < 240) {
		part_particles_burst(_ps_blue, xpos, ypos, particle_blue);
	} else {
		part_particles_burst(_ps_red, xpos, ypos, particle_red);
	}
}

#endregion