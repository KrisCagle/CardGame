// While flash is playing, count down then jump to combat
if (flash_active) {
    flash_timer--;
    if (flash_timer <= 0) {
        flash_active = false;
        obj_global.current_enemy  = variable_struct_get(obj_global.enemy_types, pending_enemy_key);
        obj_global.encounter_type = "wild";
        obj_global.return_room    = room;
        room_goto(rm_combat);
    }
    exit;
}

var px = obj_player.x;
var py = obj_player.y;
var inside = (px >= x && px <= x + patch_w && py >= y && py <= y + patch_h);

if (inside) {
    var moving = (keyboard_check(vk_left) || keyboard_check(vk_right)
               || keyboard_check(vk_up)   || keyboard_check(vk_down)
               || keyboard_check(ord("A"))|| keyboard_check(ord("D"))
               || keyboard_check(ord("W"))|| keyboard_check(ord("S")));

    if (moving) steps_in_grass++;

    if (steps_in_grass >= encounter_threshold) {
        steps_in_grass        = 0;
        encounter_threshold   = 8 + irandom(8);
        pending_enemy_key     = wild_pool[irandom(array_length(wild_pool) - 1)];
        flash_active          = true;
        flash_timer           = 40; // ~0.65 seconds at 60fps
    }
} else {
    if (was_inside) steps_in_grass = 0;
}

was_inside = inside;
