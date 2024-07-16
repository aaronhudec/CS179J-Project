if (keyboard_check(vk_left)) {
    image_index = 1;
    // Use the object's bounding box for the hitbox
    var _hb_left = bbox_left;
    var _hb_right = bbox_right;
    var _hb_top = bbox_top;
    var _hb_bottom = bbox_bottom;

    var _note = collision_rectangle(_hb_left, _hb_top, _hb_right, _hb_bottom, obj_note, false, true);
    if (_note != noone) {
        with (_note) {
            instance_destroy();
        }
        global.score += 1;
    }
} else {
    image_index = 0;
}