if (instance_number(obj_dialogue_box) > 1) {
    instance_destroy();
    exit;
}

active        = false;
lines         = [];
line_index    = 0;
speaker_name  = "";
open_cooldown = 0;

// Called by NPCs/signs to start a conversation
function dialogue_start(_speaker, _lines) {
    speaker_name  = _speaker;
    lines         = _lines;
    line_index    = 0;
    active        = true;
    open_cooldown = 2; // skip the next 2 frames so opening Space doesn't advance immediately
}
