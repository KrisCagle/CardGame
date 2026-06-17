if (obj_global.boss_defeated) exit;

var _near = (point_distance(x, y, obj_player.x, obj_player.y) < interact_dist);

// Body â€” taller and wider than a regular NPC
draw_set_color(npc_color);
draw_rectangle(x - 20, y - 36, x + 20, y + 18, false);

// Head
draw_circle(x, y - 48, 16, false);

// Crown
draw_set_color(make_color_rgb(200, 160, 20));
draw_rectangle(x - 16, y - 68, x + 16, y - 48, false);
draw_triangle(x - 16, y - 68, x, y - 84, x + 16, y - 68, false);

// Name
draw_set_color(make_color_rgb(220, 80, 80));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 88, npc_name);

// Check guardians for prompt text
var _gate1 = "trainer_rm_boss_arena_380_420";
var _gate2 = "trainer_rm_boss_arena_986_420";
var _g1 = false; var _g2 = false;
for (var _i = 0; _i < array_length(obj_global.defeated_enemies); _i++) {
    if (obj_global.defeated_enemies[_i] == _gate1) _g1 = true;
    if (obj_global.defeated_enemies[_i] == _gate2) _g2 = true;
}
var _guards_beaten = (_g1 && _g2);

if (_near && instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
    if (!_guards_beaten) {
        draw_set_color(c_dkgray);
        draw_text(x, y - 104, "(defeat the guardians first)");
    } else if (boss_talked) {
        draw_set_color(c_red);
        draw_text(x, y - 104, "[Space] Fight!");
    } else {
        draw_set_color(c_yellow);
        draw_text(x, y - 104, "[Space]");
    }
}
