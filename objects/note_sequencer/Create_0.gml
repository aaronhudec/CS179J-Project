// Uses room_get_name() to load the current room's midi data file
var midi_data = file_text_open_read(room_get_name(room) + "_midi_data.json");
var json_raw_string = "";

while (!file_text_eof(midi_data)) {
    json_raw_string += file_text_read_string(midi_data);
    file_text_readln(midi_data);
}

file_text_close(midi_data);

// Parse the JSON MIDI data
var json_data = json_parse(json_raw_string);

// Retrieve the tempo and calculate note durations
var tempo = json_data.tempo;
var ticks_per_quarter_note = 96; // 96 ticks in the MIDI data corresponds to a quarter note
var quarter_note_duration = 60 / tempo; // Duration of a quarter note in seconds
var tick_duration = quarter_note_duration / ticks_per_quarter_note; // how many seconds are in a tick
var tick_buffer = 47; // SPEEDTEST: buffer to accomodate slower note falling speed
					  // tick_buffer = buffer in seconds * fps
self.song_time_buffer = 0; // SPEEDTEST: buffer var that gets added to current_song_time

// Note falling speed, based on song tempo and Y pixels from the spawn point to the yellow GUI bar
global.fps_cap = 60;
global.note_speed = 195 / (quarter_note_duration * global.fps_cap);

// Priority queue to store the notes
global.pq = ds_priority_create();

// x coordinate for each note column
global.columns = [25, 79, 133, 187, 241, 295];

// Function to add notes to the priority queue
function enqueue_notes(notes, note_type, tick_duration) {
    for (var j = 0; j < array_length(notes); j++) {
        var note = notes[j];
        note.type = note_type;  // Store the note type for spawn_note function
        note.time = note.time * tick_duration; // Convert note time from ticks to seconds
        note.duration = note.duration * tick_duration; // Convert note duration from ticks to seconds
        ds_priority_add(global.pq, note, note.time);
    }
}

// Add notes to the priority queue from JSON data
enqueue_notes(json_data.notes.LEFT, "LEFT", tick_duration);
enqueue_notes(json_data.notes.UP, "UP", tick_duration);
enqueue_notes(json_data.notes.DOWN, "DOWN", tick_duration);
enqueue_notes(json_data.notes.RIGHT, "RIGHT", tick_duration);
enqueue_notes(json_data.notes.A, "A", tick_duration);
enqueue_notes(json_data.notes.B, "B", tick_duration);

function spawn_note(note_type, note_duration) {
    var x_coordinate;
    switch(note_type) {
        case "LEFT": x_coordinate = global.columns[0]; break;
        case "DOWN": x_coordinate = global.columns[1]; break; // UP DOWN SWAP
        case "UP": x_coordinate = global.columns[2]; break;
        case "RIGHT": x_coordinate = global.columns[3]; break;
        case "A": x_coordinate = global.columns[4]; break;
        case "B": x_coordinate = global.columns[5]; break;
    }

	if (x_coordinate > 240) {
		var note_instance = instance_create_layer(x_coordinate, -10, "Notes", obj_note);
		note_instance.type = note_type;
	    note_instance.duration = note_duration;
		note_instance.speed = 4; // SPEEDTEST hardcode note speed to 4
	    //note_instance.speed = global.note_speed; // Set how fast the note moves, we calculated earlier
	    note_instance.direction = 270; // Note moves down
	} else {
		var note_instance = instance_create_layer(x_coordinate, -10, "Notes", obj_note_blue);
		note_instance.type = note_type;
	    note_instance.duration = note_duration;
		note_instance.speed = 4; // SPEEDTEST hardcode note speed to 4
	    //note_instance.speed = global.note_speed; // Set how fast the note moves, we calculated earlier
	    note_instance.direction = 270; // Note moves down
	}
 
}

// Alarm to delay the start of the music for 3 seconds (180 frames @ 60fps) for "Get ready!" text
alarm[0] = 180;

// Alarm buffer to accomodate note falling speed, alarm[0]+tick_buffer
alarm[1] = alarm[0]+tick_buffer;
