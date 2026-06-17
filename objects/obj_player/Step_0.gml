// Toggle deck viewer
if (keyboard_check_pressed(vk_tab)) {
    show_deck = !show_deck;
}

// Freeze movement while dialogue, shop, deck, or cutscene is active
if (obj_global.player_locked) exit;
if (instance_exists(obj_dialogue_box) && obj_dialogue_box.active) exit;
if (instance_exists(obj_shop) && obj_shop.open) exit;
if (show_deck) exit;

pending_dx = 0;
pending_dy = 0;

if (keyboard_check(vk_left)  || keyboard_check(ord("A"))) pending_dx = -speed_walk;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) pending_dx =  speed_walk;
if (keyboard_check(vk_up)    || keyboard_check(ord("W"))) pending_dy = -speed_walk;
if (keyboard_check(vk_down)  || keyboard_check(ord("S"))) pending_dy =  speed_walk;

// Wall collision — manual bbox since walls have no sprite
with (obj_wall) {
    var _hw = wall_hw * abs(image_xscale);
    var _hh = wall_hh * abs(image_yscale);
    if (abs(other.x + other.pending_dx - x) <= _hw + 10
    && abs(other.y - y) <= _hh + 10) {
        other.pending_dx = 0;
    }
    if (abs(other.x - x) <= _hw + 10
    && abs(other.y + other.pending_dy - y) <= _hh + 10) {
        other.pending_dy = 0;
    }
}

x += pending_dx;
y += pending_dy;

x = clamp(x, 16, room_width  - 16);
y = clamp(y, 16, room_height - 16);
