if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (point_distance(x, y, obj_player.x, obj_player.y) >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

read = true;

var _lines;
if (obj_global.boss_defeated) {
    // Boss beaten — runes pulse more, player understands more
    _lines = [
        "The runes glow brighter now that the Warden is gone.",
        "You can make out more of the pattern.",
        "They describe something called 'The Codex' — a place where all card power originates.",
        "A Weaver sealed themselves inside it long ago.",
        "The inscription ends: 'Do not open what was closed in grief.'"
    ];
} else {
    _lines = [
        "These markings... they're not mining survey marks.",
        "They predate this mine by centuries, carved straight into the bedrock.",
        "The symbols pulse faintly — like they're still active.",
        "You recognize one of them.",
        "It matches a pattern printed on the back of every card in your deck."
    ];
}

with (obj_dialogue_box) { dialogue_start("Ancient Inscription", _lines); }
