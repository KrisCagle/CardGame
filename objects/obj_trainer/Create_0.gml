// Set which enemy type this trainer uses — override per-instance in the room editor
// e.g. enemy_key = "brute" or "ranger"
enemy_key = "grunt";

// Unique ID for defeat tracking: "trainer_roomname_x_y"
defeat_id = "trainer_" + room_get_name(room) + "_" + string(x) + "_" + string(y);

// Destroy self if already defeated this run
var _defeated = obj_global.defeated_enemies;
for (var i = 0; i < array_length(_defeated); i++) {
    if (_defeated[i] == defeat_id) {
        instance_destroy();
        exit;
    }
}
