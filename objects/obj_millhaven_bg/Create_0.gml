depth = 100;

// Warm amber lantern flicker offsets
lanterns = [];
var _lx = [310, 640, 900, 1120, 1290];
for (var _i = 0; _i < array_length(_lx); _i++) {
    array_push(lanterns, { x: _lx[_i], phase: random(6.28) });
}
