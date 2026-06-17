// Trigger fight when player walks close and presses Space
if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
        // Mark as defeated so it won't respawn
        array_push(obj_global.defeated_enemies, defeat_id);

        // Set up the encounter
        obj_global.current_enemy   = variable_struct_get(obj_global.enemy_types, enemy_key);
        obj_global.encounter_type  = "trainer";
        obj_global.return_room     = room;

        room_goto(rm_combat);
    }
}
