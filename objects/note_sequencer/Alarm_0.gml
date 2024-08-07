// Get the room's name so we can play its music
var full_room_name = room_get_name(room);

// Find where the last underscore is, for the _Easy or _Normal in the room name
var underscore_position = string_last_pos("_", full_room_name);

// Remove the _Easy or _Normal difficulty suffix to avoid having duplicate song files
var base_room_name = string_copy(full_room_name, 1, underscore_position - 1);

var song_name = base_room_name + "_Music";

// Play the song
self.music_sound_id = audio_play_sound(asset_get_index(song_name), 1, false);