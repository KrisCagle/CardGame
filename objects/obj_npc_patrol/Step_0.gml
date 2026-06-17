if (!instance_exists(obj_dialogue_box)) exit;

// Dialogue check
if (!obj_dialogue_box.active && obj_dialogue_box.open_cooldown <= 0) {
    if (keyboard_check_pressed(vk_space)) {
        if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
            with (obj_dialogue_box) {
                dialogue_start(other.npc_name, other.dialogue);
            }
            exit;
        }
    }
}

// Don't patrol while talking
if (obj_dialogue_box.active) exit;

// Patrol movement
if (patrol_pause > 0) {
    patrol_pause--;
} else {
    x += patrol_speed * patrol_dir;
    if (x >= patrol_x2) { x = patrol_x2; patrol_dir = -1; patrol_pause = 45; }
    if (x <= patrol_x1) { x = patrol_x1; patrol_dir =  1; patrol_pause = 45; }
}
