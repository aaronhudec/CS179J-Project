image_speed = 0;

if (keyboard_check(vk_up)) {
    image_index = 1;
} else {
    image_index = 0;
}

if (keyboard_check_pressed(vk_up)) {
    // Use the object's bounding box for the hitbox
    var _hb_left = bbox_left;
    var _hb_right = bbox_right;
    var _hb_top = bbox_top;
    var _hb_bottom = bbox_bottom;

    var _note = collision_rectangle(_hb_left, _hb_top-16, _hb_right, _hb_bottom-16, obj_note_blue, false, true);
    if (_note != noone) {
        with (_note) {
            instance_destroy();
        }
    }
}