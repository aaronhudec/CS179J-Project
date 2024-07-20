global.orig_score = global.score;
global.test_score = 0;

// Spawn notes
instance_create_layer(20, -10, "Instances", obj_note);  // Left button
instance_create_layer(70, -10, "Instances", obj_note);  // Up button
instance_create_layer(120, -10, "Instances", obj_note); // Down button
instance_create_layer(170, -10, "Instances", obj_note); // Right button
instance_create_layer(220, -10, "Instances", obj_note); // A button
instance_create_layer(270, -10, "Instances", obj_note); // B button

alarm[0] = 65; // Basically a delay, wait X number of steps before executing alarm[0]