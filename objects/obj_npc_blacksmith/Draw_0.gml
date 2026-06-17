// NPC body
draw_set_color(npc_color);
draw_rectangle(x - 10, y - 30, x + 10, y + 16, false);
draw_set_color(make_color_rgb(210, 175, 140));
draw_circle(x, y - 40, 11, false);
// Apron
draw_set_color(make_color_rgb(80, 55, 35));
draw_rectangle(x - 8, y - 20, x + 8, y + 16, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 56, npc_name + " — Blacksmith");

if (!open && instance_exists(obj_player)
&& point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(255, 200, 80));
    draw_text(x, y - 70, "[Space] Forge  (" + string(upgrade_cost) + "g/upgrade)");
}

// ---- Forge UI overlay ----
if (!open) exit;

var _upgradeable = [];
for (var _i = 0; _i < array_length(obj_global.deck); _i++) {
    if (obj_global.deck[_i].level < 3) array_push(_upgradeable, _i);
}
if (array_length(_upgradeable) == 0) exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// Dim background
draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

// Header
draw_set_color(make_color_rgb(255, 180, 60));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_gw / 2, 28, "FORGE  —  Choose a card to upgrade  (" + string(upgrade_cost) + "g)");
draw_set_color(make_color_rgb(160, 160, 160));
draw_text(_gw / 2, 54, "◄ ► to browse    [Space] confirm    [Esc] cancel");

// Show gold
draw_set_color(c_yellow);
draw_text(_gw / 2, 76, "Gold: " + string(obj_global.gold));

// Card display
var _cidx = _upgradeable[selected];
var _card = obj_global.deck[_cidx];
var _cw = 180;
var _ch = 140;
var _cx = (_gw - _cw) / 2;
var _cy = (_gh - _ch) / 2 - 20;
draw_card(_card, _cx, _cy, _cw, _ch, false, true);

// Level pip display below card
var _pip_x = _gw / 2 - 20;
var _pip_y = _cy + _ch + 16;
for (var _lv = 1; _lv <= 3; _lv++) {
    if (_lv <= _card.level) {
        draw_set_color(make_color_rgb(255, 200, 60));
    } else {
        draw_set_color(make_color_rgb(70, 70, 70));
    }
    draw_circle(_pip_x + (_lv - 1) * 24, _pip_y, 8, false);
}
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_text(_gw / 2, _pip_y + 16, "Level " + string(_card.level) + " / 3");

// Upgrade preview
if (_card.level < 3) {
    var _gain = obj_global.card_level_bonus(_card.type, 1);
    draw_set_color(make_color_rgb(120, 220, 120));
    draw_text(_gw / 2, _pip_y + 36,
        "+" + string(_gain) + " " + _card.type + " value after upgrade");
}

// Scroll indicator
if (array_length(_upgradeable) > 1) {
    draw_set_color(make_color_rgb(160, 160, 160));
    draw_text(_gw / 2, _cy - 28,
        string(selected + 1) + " / " + string(array_length(_upgradeable)) + " upgradeable cards");
}
