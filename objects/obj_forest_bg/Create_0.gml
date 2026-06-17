depth = 100;

// Firefly / mote particles
motes = [];
repeat (35) {
    array_push(motes, {
        x:     random(room_width),
        y:     random(room_height),
        spd:   random(0.35) + 0.08,
        drift: random(0.6) - 0.3,
        phase: random(6.28),
        alpha: random(0.45) + 0.1,
    });
}

// Light shaft angles — dappled rays from above
shafts = [];
var _shaft_x = [220, 460, 750, 1050, 1400, 1700];
for (var _i = 0; _i < array_length(_shaft_x); _i++) {
    array_push(shafts, {
        x:    _shaft_x[_i],
        lean: random(40) - 20,
        w:    20 + irandom(30),
        a:    random(0.09) + 0.03,
    });
}
