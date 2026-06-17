var _t    = current_time * 0.001;
var _dist = instance_exists(obj_player) ? point_distance(x, y, obj_player.x, obj_player.y) : 999;

// Small campfire at her feet
var _flicker = sin(_t * 8 + x) * 0.25 + 0.75;
draw_set_alpha(_flicker * 0.5);
draw_set_color(make_color_rgb(255, 120, 30));
draw_circle(x, y + 28, 14, false);
draw_set_alpha(_flicker * 0.8);
draw_set_color(make_color_rgb(255, 200, 50));
draw_circle(x, y + 28, 8, false);
draw_set_alpha(1);
// Fire logs
draw_set_color(make_color_rgb(60, 40, 20));
draw_rectangle(x - 12, y + 32, x + 12, y + 36, false);

// Figure — robed healer
// Robe
draw_set_color(make_color_rgb(140, 160, 180));
draw_rectangle(x - 14, y - 32, x + 14, y + 20, false);
// Hood/head
draw_set_color(make_color_rgb(120, 140, 160));
draw_circle(x, y - 42, 14, false);
draw_rectangle(x - 14, y - 48, x + 14, y - 32, false);
// Face (warm skin tone peeking from hood)
draw_set_color(make_color_rgb(200, 170, 140));
draw_circle(x, y - 42, 9, false);
// Healing symbol on robe (green cross)
draw_set_color(make_color_rgb(80, 180, 100));
draw_rectangle(x - 6, y - 22, x + 6, y - 2, false);
draw_rectangle(x - 12, y - 16, x + 12, y - 8, false);

// Warmth aura glow from fire
draw_set_alpha(0.12 * _flicker);
draw_set_color(make_color_rgb(255, 140, 40));
draw_circle(x, y + 20, 40, false);
draw_set_alpha(1);

// Name
draw_set_color(make_color_rgb(160, 210, 160));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 62, npc_name);

// Prompt + HP hint
if (_dist < interact_dist) {
    var _hp_col = (obj_global.player_hp < obj_global.player_hp_max)
                ? make_color_rgb(255, 140, 120)
                : make_color_rgb(180, 220, 180);
    draw_set_color(_hp_col);
    draw_text(x, y - 76, "[Space] Rest");
}
