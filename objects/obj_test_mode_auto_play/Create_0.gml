// Turn itself off if test mode isn't activated
if (!global.activate_test_mode) {
    instance_deactivate_object(self);
} else {
    instance_activate_object(self);
}

// Define x-coordinates for each button, using the columns array defined in note_sequencer
x_left = global.columns[0];
x_down = global.columns[1];
x_up = global.columns[2];
x_right = global.columns[3];
x_a = global.columns[4];
x_b = global.columns[5];