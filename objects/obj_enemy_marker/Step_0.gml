if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 40) {
        obj_global.current_enemy  = variable_struct_get(obj_global.enemy_types, enemy_key);
        obj_global.encounter_type = "wild";
        obj_global.return_room    = room;
        room_goto(rm_combat);
    }
}
