if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);

// Close forge UI when player walks away
if (_dist > interact_dist + 40) {
    open = false;
    exit;
}

if (_dist >= interact_dist) exit;

// Open forge UI on Space (when dialogue not active)
if (!open) {
    if (keyboard_check_pressed(vk_space)
    && instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
        // Build upgradeable list
        var _upgradeable = [];
        for (var _i = 0; _i < array_length(obj_global.deck); _i++) {
            if (obj_global.deck[_i].level < 3) array_push(_upgradeable, _i);
        }
        if (array_length(_upgradeable) == 0) {
            with (obj_dialogue_box) {
                dialogue_start("Mira", ["Your deck is fully mastered. Impressive.", "I've never seen a complete set before."]);
            }
        } else {
            open     = true;
            selected = 0;
        }
    }
    exit;
}

// Forge UI open — handle navigation
var _upgradeable = [];
for (var _i = 0; _i < array_length(obj_global.deck); _i++) {
    if (obj_global.deck[_i].level < 3) array_push(_upgradeable, _i);
}

if (array_length(_upgradeable) == 0) { open = false; exit; }
selected = clamp(selected, 0, array_length(_upgradeable) - 1);

if (keyboard_check_pressed(vk_left))
    selected = (selected - 1 + array_length(_upgradeable)) mod array_length(_upgradeable);
if (keyboard_check_pressed(vk_right))
    selected = (selected + 1) mod array_length(_upgradeable);

if (keyboard_check_pressed(vk_escape)) { open = false; exit; }

if (keyboard_check_pressed(vk_space)) {
    var _card = obj_global.deck[_upgradeable[selected]];
    if (obj_global.gold >= upgrade_cost) {
        obj_global.gold -= upgrade_cost;
        _card.level++;
        _card.value = _card.base_value + obj_global.card_level_bonus(_card.type, _card.level - 1);
        open = false;
        with (obj_dialogue_box) {
            dialogue_start("Mira", [
                "There. Forged it right into the weave.",
                "You'll feel the difference next time it hits."
            ]);
        }
    } else {
        with (obj_dialogue_box) {
            dialogue_start("Mira", ["That'll cost " + string(other.upgrade_cost) + " gold. Come back when you've got it."]);
        }
        open = false;
    }
}
