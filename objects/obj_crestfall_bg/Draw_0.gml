var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky â€” clear blue, civilized air
draw_set_color(make_color_rgb(100, 140, 190));
draw_rectangle(0, 0, _w, _h * 0.38, false);
// Horizon fade
draw_set_alpha(0.3);
draw_set_color(make_color_rgb(200, 200, 180));
draw_rectangle(0, _h * 0.25, _w, _h * 0.38, false);
draw_set_alpha(1);

// Ground â€” cobblestone city floor
draw_set_color(make_color_rgb(100, 92, 82));
draw_rectangle(0, _h * 0.38, _w, _h, false);
// Cobble pattern
draw_set_color(make_color_rgb(88, 80, 70));
for (var _cy2 = 0; _cy2 < 5; _cy2++) {
    for (var _cx2 = 0; _cx2 < 22; _cx2++) {
        var _ox = (_cy2 mod 2) * 44;
        draw_rectangle(_cx2 * 88 + _ox, _h * 0.38 + _cy2 * 52,
                       _cx2 * 88 + _ox + 80, _h * 0.38 + _cy2 * 52 + 46, true);
    }
}

// CITY WALL â€” back wall spanning the width
draw_set_color(make_color_rgb(130, 118, 96));
draw_rectangle(0, 190, _w, 310, false);
// Crenellations across the top
draw_set_color(make_color_rgb(148, 134, 110));
for (var _cr = 0; _cr < 36; _cr++) {
    draw_rectangle(_cr * 56, 168, _cr * 56 + 40, 192, false);
}
// Wall shadow
draw_set_alpha(0.25);
draw_set_color(c_black);
draw_rectangle(0, 295, _w, 315, false);
draw_set_alpha(1);

// MAIN GATE â€” center
draw_set_color(make_color_rgb(80, 70, 58));
draw_rectangle(630, 180, 780, 390, false); // gate arch left pillar
draw_rectangle(900, 180, 1050, 390, false); // gate arch right pillar
// Arch
draw_set_color(make_color_rgb(60, 52, 42));
draw_rectangle(630, 180, 1050, 220, false);
// Gate doors (dark wood)
draw_set_color(make_color_rgb(50, 38, 24));
draw_rectangle(640, 220, 700, 390, false);
draw_rectangle(980, 220, 1040, 390, false);
// Gate door planks
draw_set_color(make_color_rgb(42, 32, 18));
for (var _dp = 0; _dp < 5; _dp++) {
    draw_rectangle(640, 230 + _dp * 32, 700, 236 + _dp * 32, false);
    draw_rectangle(980, 230 + _dp * 32, 1040, 236 + _dp * 32, false);
}
// Portcullis bars
draw_set_color(make_color_rgb(55, 55, 60));
for (var _bar = 0; _bar < 5; _bar++) {
    draw_rectangle(710 + _bar * 30, 220, 718 + _bar * 30, 390, false);
}
draw_rectangle(710, 270, 850, 278, false);
draw_rectangle(710, 330, 850, 338, false);

// TOWERS flanking gate
draw_set_color(make_color_rgb(118, 106, 88));
draw_rectangle(520, 100, 640, 310, false); // left tower
draw_rectangle(1040, 100, 1160, 310, false); // right tower
// Tower crenellations
draw_set_color(make_color_rgb(138, 124, 100));
for (var _tc = 0; _tc < 4; _tc++) {
    draw_rectangle(524 + _tc * 28, 86, 546 + _tc * 28, 102, false);
    draw_rectangle(1044 + _tc * 28, 86, 1066 + _tc * 28, 102, false);
}
// Tower windows (arrow slits)
draw_set_color(make_color_rgb(30, 25, 20));
draw_rectangle(570, 150, 582, 190, false);
draw_rectangle(1090, 150, 1102, 190, false);
draw_rectangle(570, 215, 582, 255, false);
draw_rectangle(1090, 215, 1102, 255, false);

// BUILDINGS left of gate
var _bx = [60, 260, 440];
var _bh = [160, 140, 170];
var _bw = [150, 160, 140];
for (var _bi = 0; _bi < 3; _bi++) {
    draw_set_color(make_color_rgb(140, 124, 100));
    draw_rectangle(_bx[_bi], 310 - _bh[_bi], _bx[_bi] + _bw[_bi], 390, false);
    draw_set_color(make_color_rgb(100, 60, 40)); // roof
    draw_triangle(_bx[_bi] - 10, 310 - _bh[_bi],
                  _bx[_bi] + _bw[_bi] + 10, 310 - _bh[_bi],
                  _bx[_bi] + _bw[_bi] / 2, 310 - _bh[_bi] - 50, false);
    // Window
    draw_set_color(make_color_rgb(200, 200, 140));
    draw_set_alpha(0.7);
    draw_rectangle(_bx[_bi] + _bw[_bi] / 2 - 14, 310 - _bh[_bi] + 30,
                   _bx[_bi] + _bw[_bi] / 2 + 14, 310 - _bh[_bi] + 66, false);
    draw_set_alpha(1);
}

// BUILDINGS right of gate
var _brx = [1180, 1360, 1560, 1750];
var _brh = [155, 175, 145, 165];
var _brw = [155, 170, 145, 160];
for (var _bi2 = 0; _bi2 < 4; _bi2++) {
    draw_set_color(make_color_rgb(136, 120, 98));
    draw_rectangle(_brx[_bi2], 310 - _brh[_bi2], _brx[_bi2] + _brw[_bi2], 390, false);
    draw_set_color(make_color_rgb(95, 58, 38));
    draw_triangle(_brx[_bi2] - 10, 310 - _brh[_bi2],
                  _brx[_bi2] + _brw[_bi2] + 10, 310 - _brh[_bi2],
                  _brx[_bi2] + _brw[_bi2] / 2, 310 - _brh[_bi2] - 48, false);
    draw_set_color(make_color_rgb(200, 200, 140));
    draw_set_alpha(0.65);
    draw_rectangle(_brx[_bi2] + _brw[_bi2] / 2 - 13, 310 - _brh[_bi2] + 28,
                   _brx[_bi2] + _brw[_bi2] / 2 + 13, 310 - _brh[_bi2] + 64, false);
    draw_set_alpha(1);
}

// MARKET STALLS along the bottom
var _stall_x = [100, 340, 580, 1110, 1350, 1590, 1830];
var _colors  = [
    make_color_rgb(180,60,60), make_color_rgb(60,120,180),
    make_color_rgb(180,140,40), make_color_rgb(140,60,160),
    make_color_rgb(60,160,80),  make_color_rgb(180,100,40),
    make_color_rgb(80,140,160)
];
for (var _si2 = 0; _si2 < array_length(_stall_x); _si2++) {
    var _sx = _stall_x[_si2];
    draw_set_color(make_color_rgb(80, 70, 55));
    draw_rectangle(_sx, 440, _sx + 130, 560, false); // counter
    draw_set_color(_colors[_si2]);
    // Awning
    draw_triangle(_sx - 10, 420, _sx + 140, 420, _sx + 65, 460, false);
    // Stripe
    draw_set_color(make_color_rgb(255, 255, 255));
    draw_set_alpha(0.2);
    draw_triangle(_sx + 15, 420, _sx + 45, 420, _sx + 30, 456, false);
    draw_triangle(_sx + 75, 420, _sx + 105, 420, _sx + 90, 456, false);
    draw_set_alpha(1);
}

// FOUNTAIN center (between gate and stalls)
draw_set_color(make_color_rgb(110, 100, 90));
draw_ellipse(830 - 45, 480, 830 + 45, 530, false); // basin
draw_set_color(make_color_rgb(90, 80, 70));
draw_ellipse(830 - 45, 480, 830 + 45, 530, true);
// Water
var _splash = sin(_t * 2.5) * 2;
draw_set_alpha(0.65);
draw_set_color(make_color_rgb(100, 160, 220));
draw_ellipse(830 - 32, 486, 830 + 32, 524, false);
draw_set_alpha(1);
// Spout
draw_set_color(make_color_rgb(110, 100, 90));
draw_circle(830, 488, 6, false);
draw_set_alpha(0.5);
draw_set_color(make_color_rgb(140, 200, 240));
draw_ellipse(824, 465 + _splash, 836, 488, false);
draw_set_alpha(1);

// SHOP sign
draw_set_color(make_color_rgb(80, 60, 36));
draw_rectangle(54, 208, 166, 226, false);
draw_set_color(make_color_rgb(220, 190, 120));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(110, 217, "SHOP");

// HOSPITAL cross
draw_set_color(make_color_rgb(60, 160, 80));
draw_rectangle(296, 214, 324, 226, false);
draw_rectangle(304, 206, 316, 234, false);

// Town title
draw_set_color(make_color_rgb(220, 200, 150));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w / 2, 10, "CRESTFALL");
draw_set_color(make_color_rgb(160, 140, 100));
draw_text(_w / 2, 30, "City of the Highland Gate");
