// Walk toward target position
if (!arrived) {
    x -= move_speed; // always approaches from the right, moving left
    if (x <= target_x) {
        x       = target_x;
        arrived = true;
    }
    exit;
}

// Start dialogue once arrived
if (!dialogue_started) {
    if (instance_exists(obj_dialogue_box) && !obj_dialogue_box.active
    &&  obj_dialogue_box.open_cooldown <= 0) {
        with (obj_dialogue_box) {
            dialogue_start(other.npc_name, other.dialogue_lines);
        }
        dialogue_started = true;
    }
    exit;
}

// Wait for dialogue to close, then prepare to leave
if (!leaving && instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
    leave_delay--;
    if (leave_delay <= 0) leaving = true;
}

// Walk back off-screen to the right
if (leaving) {
    x += move_speed;
    if (x > room_width + 120) {
        obj_global.player_locked = false;
        instance_destroy();
    }
}
