note_timer += 1;
if (note_timer >= note_interval) {
    note_timer = 0;
    var col_index = irandom(array_length(columns) - 1);
    var col_x = columns[col_index];
    instance_create_layer(col_x, 0, "Instances", obj_note);
}