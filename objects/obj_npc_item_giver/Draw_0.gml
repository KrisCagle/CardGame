// Body
draw_set_color(npc_color);
draw_rectangle(x - 8, y - 28, x + 8, y + 14, false);
// Head
draw_set_color(make_color_rgb(220, 190, 160));
draw_circle(x, y - 38, 10, false);

// Name + prompt
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 52, npc_name);

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(255, 220, 80));
    draw_text(x, y - 66, "[Space] Talk");
}
