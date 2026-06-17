var near = (point_distance(x, y, obj_player.x, obj_player.y) < 48);

// Body
draw_set_color(npc_color);
draw_rectangle(x - 14, y - 28, x + 14, y + 16, false);

// Head
draw_circle(x, y - 36, 12, false);

// Name above
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 52, npc_name);

if (near && !obj_dialogue_box.active) {
    draw_set_color(c_yellow);
    draw_text(x, y - 66, "[Space]");
}
