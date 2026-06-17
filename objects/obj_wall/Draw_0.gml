var hw = wall_hw * image_xscale;
var hh = wall_hh * image_yscale;

// Fill
draw_set_color(wall_color);
draw_rectangle(x - hw, y - hh, x + hw, y + hh, false);

// Border
draw_set_color(make_color_rgb(25, 45, 20));
draw_rectangle(x - hw, y - hh, x + hw, y + hh, true);
