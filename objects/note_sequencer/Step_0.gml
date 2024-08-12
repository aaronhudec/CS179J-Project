// Uses the song position to determine when to call the spawn_note function
if (alarm[0] <= 0 && self.music_sound_id != -1) {
    var current_song_time = audio_sound_get_track_position(self.music_sound_id);

    // Check the priority queue and spawn notes
    while (!ds_priority_empty(global.pq)) {
        var next_note = ds_priority_find_min(global.pq);

        if (next_note.time <= current_song_time) {
            spawn_note(next_note.type, next_note.duration);

            // Remove the note from the priority queue
            ds_priority_delete_min(global.pq);
        } else {
            break;
        }
    }
}