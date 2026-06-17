var _t = current_time * 0.001;

if (is_defeated()) {
    draw_set_color(make_color_rgb(80, 140, 200));
    draw_set_alpha(0.3);
    draw_rectangle(x - 30, y - 20, x + 30, y + 40, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(140, 190, 240));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 30, "Glacial Warden (shattered)");
    exit;
}

if (dormant) {
    // Looks like an ice formation
    draw_set_color(make_color_rgb(60, 110, 170));
    draw_rectangle(x - 30, y - 40, x + 30, y + 40, false);
    draw_triangle(x - 30, y - 40, x, y - 90, x + 30, y - 40, false);
    draw_set_color(make_color_rgb(120, 180, 240));
    draw_set_alpha(0.5);
    draw_triangle(x - 10, y - 40, x, y - 90, x + 10, y - 40, false);
    draw_set_alpha(1);
    exit;
}

var _t2 = current_time * 0.001;
// Enormous ice golem â€” taller and wider than the stone warden
// Legs
draw_set_color(make_color_rgb(50, 100, 160));
draw_rectangle(x - 22, y + 10, x - 6,  y + 55, false);
draw_rectangle(x + 6,  y + 10, x + 22, y + 55, false);
// Torso â€” wide ice block
draw_set_color(make_color_rgb(55, 110, 175));
draw_rectangle(x - 36, y - 60, x + 36, y + 14, false);
// Chest crystal glow
var _cg = sin(_t2 * 2) * 0.15 + 0.7;
draw_set_alpha(_cg);
draw_set_color(make_color_rgb(160, 220, 255));
draw_rectangle(x - 18, y - 48, x + 18, y - 16, true);
draw_set_alpha(1);
// Arms â€” thick ice slabs
draw_set_color(make_color_rgb(48, 96, 155));
draw_rectangle(x - 58, y - 50, x - 36, y + 10, false);
draw_rectangle(x + 36, y - 50, x + 58, y + 10, false);
// Fists â€” ice blocks
draw_set_color(make_color_rgb(40, 82, 138));
draw_rectangle(x - 62, y + 4, x - 34, y + 26, false);
draw_rectangle(x + 34, y + 4, x + 62, y + 26, false);
// Head â€” hexagonal ice mass
draw_set_color(make_color_rgb(65, 125, 190));
draw_rectangle(x - 26, y - 98, x + 26, y - 60, false);
draw_triangle(x - 30, y - 98, x,      y - 120, x + 30, y - 98, false);
// Eye glow (twin ice-blue orbs)
var _eg = sin(_t2 * 3) * 0.15 + 0.78;
draw_set_alpha(_eg);
draw_set_color(make_color_rgb(180, 230, 255));
draw_circle(x - 12, y - 82, 7, false);
draw_circle(x + 12, y - 82, 7, false);
draw_set_alpha(1);
// Ice spike shoulder armor
draw_set_color(make_color_rgb(90, 160, 220));
draw_triangle(x - 58, y - 55, x - 48, y - 80, x - 38, y - 55, false);
draw_triangle(x + 38, y - 55, x + 48, y - 80, x + 58, y - 55, false);

// Name and prompt
draw_set_color(make_color_rgb(160, 210, 255));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 130, "Glacial Warden");
if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(200, 235, 255));
    draw_text(x, y - 144, "[Space]");
}
