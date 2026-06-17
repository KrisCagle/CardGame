opened   = false;
defeat_id = "chest_" + room_get_name(room) + "_" + string(x) + "_" + string(y);

// Check if already opened this run
var _defeated = obj_global.defeated_enemies;
for (var i = 0; i < array_length(_defeated); i++) {
    if (_defeated[i] == defeat_id) {
        opened = true;
        exit;
    }
}

// What this chest contains: "gold", "card", or "relic"
reward_type = "gold";
reward_value = 15 + irandom(20); // gold amount — ignored for card/relic types
