var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky â€” heavy overcast, greenish-grey
draw_set_color(make_color_rgb(50, 60, 48));
draw_rectangle(0, 0, _w, _h * 0.3, false);

// Bogwater base â€” the whole town sits over the swamp
draw_set_color(make_color_rgb(24, 36, 22));
draw_rectangle(0, _h * 0.3, _w, _h, false);

// Swamp water shimmer
for (var _si = 0; _si < 8; _si++) {
    var _sx = _si * 190 + 40;
    var _sa = sin(_t * 1.2 + _si * 0.8) * 0.06 + 0.12;
    draw_set_alpha(_sa);
    draw_set_color(make_color_rgb(40, 70, 44));
    draw_rectangle(_sx, _h * 0.45, _sx + 140, _h * 0.55, false);
    draw_set_alpha(1);
}

// STILT STRUCTURES â€” buildings raised on wooden poles over the water
// Building 1: Shop (left side)
var _shop_x = 180;
draw_set_color(make_color_rgb(48, 36, 24)); // dark wood
draw_rectangle(_shop_x - 70, 220, _shop_x + 70, 380, false); // building body
draw_set_color(make_color_rgb(38, 28, 18)); // roof
draw_triangle(_shop_x - 85, 220, _shop_x + 85, 220, _shop_x, 160, false);
// Stilts
draw_set_color(make_color_rgb(32, 24, 14));
draw_rectangle(_shop_x - 55, 380, _shop_x - 46, 520, false);
draw_rectangle(_shop_x + 46, 380, _shop_x + 55, 520, false);
// Door
draw_set_color(make_color_rgb(28, 20, 12));
draw_rectangle(_shop_x - 16, 320, _shop_x + 16, 380, false);
// Sign
draw_set_color(make_color_rgb(70, 52, 32));
draw_rectangle(_shop_x - 28, 230, _shop_x + 28, 252, false);
draw_set_color(make_color_rgb(180, 150, 100));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_shop_x, 241, "SHOP");

// Building 2: Hospital
var _hosp_x = 420;
draw_set_color(make_color_rgb(44, 50, 38));
draw_rectangle(_hosp_x - 65, 230, _hosp_x + 65, 385, false);
draw_set_color(make_color_rgb(34, 40, 28));
draw_triangle(_hosp_x - 80, 230, _hosp_x + 80, 230, _hosp_x, 168, false);
draw_set_color(make_color_rgb(32, 24, 14));
draw_rectangle(_hosp_x - 55, 385, _hosp_x - 46, 520, false);
draw_rectangle(_hosp_x + 46, 385, _hosp_x + 55, 520, false);
draw_set_color(make_color_rgb(28, 20, 12));
draw_rectangle(_hosp_x - 16, 325, _hosp_x + 16, 385, false);
draw_set_color(make_color_rgb(80, 130, 80));
draw_rectangle(_hosp_x - 14, 248, _hosp_x + 14, 270, false); // green cross
draw_rectangle(_hosp_x - 26, 254, _hosp_x + 26, 264, false);

// Building 3: NPC house (right side)
var _house_x = 900;
draw_set_color(make_color_rgb(42, 32, 22));
draw_rectangle(_house_x - 55, 240, _house_x + 55, 390, false);
draw_set_color(make_color_rgb(34, 26, 16));
draw_triangle(_house_x - 68, 240, _house_x + 68, 240, _house_x, 180, false);
draw_set_color(make_color_rgb(28, 22, 12));
draw_rectangle(_house_x - 45, 390, _house_x - 36, 520, false);
draw_rectangle(_house_x + 36, 390, _house_x + 45, 520, false);
draw_set_color(make_color_rgb(24, 18, 10));
draw_rectangle(_house_x - 14, 330, _house_x + 14, 390, false);

// Rope bridges between buildings
draw_set_color(make_color_rgb(55, 42, 28));
draw_line_width(_shop_x + 70, 360, _hosp_x - 65, 365, 5);
draw_line_width(_hosp_x + 65, 355, _house_x - 55, 360, 5);
// Bridge planks
draw_set_color(make_color_rgb(42, 32, 20));
var _bridge1_len = (_hosp_x - 65) - (_shop_x + 70);
for (var _bi = 0; _bi < 5; _bi++) {
    var _bx = _shop_x + 70 + _bi * (_bridge1_len / 5) + 10;
    draw_rectangle(_bx, 356, _bx + 16, 368, false);
}
var _bridge2_len = (_house_x - 55) - (_hosp_x + 65);
for (var _bi = 0; _bi < 5; _bi++) {
    var _bx = _hosp_x + 65 + _bi * (_bridge2_len / 5) + 10;
    draw_rectangle(_bx, 352, _bx + 16, 363, false);
}

// Dead willow trees at edges
draw_set_color(make_color_rgb(28, 24, 18));
draw_rectangle(1120 - 6, 180, 1120 + 6, 430, false);
draw_line_width(1120, 220, 1060, 170, 4);
draw_line_width(1120, 250, 1170, 195, 4);
// Draping moss
draw_set_alpha(0.55);
draw_set_color(make_color_rgb(48, 68, 38));
var _ms = sin(_t * 0.4) * 4;
draw_line(1060, 170, 1060 + _ms, 240);
draw_line(1070, 170, 1070 + _ms, 235);
draw_line(1170, 195, 1170 + _ms, 265);
draw_line(1180, 195, 1180 + _ms, 258);
draw_set_alpha(1);

// Ground-level mud walkway
draw_set_color(make_color_rgb(46, 40, 30));
draw_rectangle(0, 390, _w, 440, false);

// Wisps
for (var _wi = 0; _wi < 8; _wi++) {
    var _wx = (_wi * 157 + sin(_t * 0.25 + _wi) * 20) mod _w;
    var _wy = 380 + sin(_t * 1.0 + _wi * 1.4) * 50;
    var _wa = sin(_t * 1.8 + _wi * 1.1) * 0.3 + 0.35;
    draw_set_alpha(_wa);
    draw_set_color(make_color_rgb(130, 210, 90));
    draw_circle(_wx, _wy, 4, false);
    draw_set_alpha(_wa * 0.25);
    draw_circle(_wx, _wy, 11, false);
    draw_set_alpha(1);
}

// Town name
draw_set_color(make_color_rgb(140, 170, 120));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w / 2, 10, "ROTHMERE");
draw_set_color(make_color_rgb(90, 110, 80));
draw_text(_w / 2, 30, "Town on the Bog");
