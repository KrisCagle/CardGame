if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (is_defeated()) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

if (!talked) {
    talked = true;
    with (obj_dialogue_box) {
        dialogue_start("The First Weaver", [
            "You've read your way here. Every card you played was a word in a sentence.",
            "I wrote the first card to name something I couldn't say aloud.",
            "I kept writing. The Codex grew around me. I grew with it.",
            "I'm not your enemy.",
            "But you have to earn what's written in these pages.",
            "Everyone who has ever held a card has carried a piece of this place.",
            "Now show me what you've learned."
        ]);
    }
} else {
    obj_global.current_enemy  = obj_global.enemy_types.first_weaver;
    obj_global.encounter_type = "trainer";
    obj_global.return_room    = rm_ending;
    room_goto(rm_combat);
}
