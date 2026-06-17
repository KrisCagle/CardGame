function save_game() {
    var _g = instance_find(obj_global, 0);
    if (!instance_exists(_g)) return;

    // Serialize deck — strip down to only the fields we need to reconstruct
    var _deck_data = [];
    for (var i = 0; i < array_length(_g.deck); i++) {
        var _c = _g.deck[i];
        array_push(_deck_data, {
            name:          _c.name,
            cost:          _c.cost,
            type:          _c.type,
            base_value:    _c.base_value,
            level:         _c.level,
            card_xp:       _c.card_xp,
            element:       variable_struct_exists(_c, "element")       ? _c.element       : "physical",
            status_effect: variable_struct_exists(_c, "status_effect") ? _c.status_effect : "",
            status_value:  variable_struct_exists(_c, "status_value")  ? _c.status_value  : 0,
        });
    }

    // Save the room the player is returning to so we can resume there
    var _last_room = room_get_name(_g.return_room);

    var _save = {
        player_hp:          _g.player_hp,
        player_hp_max:      _g.player_hp_max,
        gold:               _g.gold,
        experience:         _g.experience,
        boss_defeated:      _g.boss_defeated,
        relics:             _g.relics,
        defeated_enemies:   _g.defeated_enemies,
        deck:               _deck_data,
        items:              _g.items,
        tried_blackwood:    _g.tried_blackwood,
        blackwood_cleared:  _g.blackwood_cleared,
        last_room:          _last_room,
    };

    var _path = working_directory + "savegame.dat";
    var _f    = file_text_open_write(_path);
    file_text_write_string(_f, json_stringify(_save));
    file_text_close(_f);
}

function load_game() {
    var _path = working_directory + "savegame.dat";
    if (!file_exists(_path)) return false;

    var _f    = file_text_open_read(_path);
    var _json = file_text_read_string(_f);
    file_text_close(_f);

    if (_json == "") return false;

    var _g = instance_find(obj_global, 0);
    if (!instance_exists(_g)) return false;

    var _data = json_parse(_json);

    _g.player_hp        = _data.player_hp;
    _g.player_hp_max    = _data.player_hp_max;
    _g.gold             = _data.gold;
    _g.experience       = _data.experience;
    _g.boss_defeated    = _data.boss_defeated;
    _g.relics           = _data.relics;
    _g.defeated_enemies = _data.defeated_enemies;

    // Backwards-compatible fields added in blackwood update
    _g.items             = variable_struct_exists(_data, "items")             ? _data.items             : [];
    _g.tried_blackwood   = variable_struct_exists(_data, "tried_blackwood")   ? _data.tried_blackwood   : false;
    _g.blackwood_cleared = variable_struct_exists(_data, "blackwood_cleared") ? _data.blackwood_cleared : false;

    // Rebuild deck as proper Card structs so all fields survive save/load
    _g.deck = [];
    for (var i = 0; i < array_length(_data.deck); i++) {
        var _cd = _data.deck[i];
        // Backwards-compat: old saves may not have element/status fields
        var _elem   = variable_struct_exists(_cd, "element")       ? _cd.element       : "physical";
        var _sfx    = variable_struct_exists(_cd, "status_effect") ? _cd.status_effect : "";
        var _sval   = variable_struct_exists(_cd, "status_value")  ? _cd.status_value  : 0;
        var _c      = new Card(_cd.name, _cd.cost, _cd.type, _cd.base_value, _elem, _sfx, _sval);
        _c.level    = _cd.level;
        _c.card_xp  = _cd.card_xp;
        _c.value    = _cd.base_value + card_level_bonus(_cd.type, _cd.level - 1);
        array_push(_g.deck, _c);
    }

    // Restore the room the player was in — caller can room_goto(_g.last_room_id)
    var _room_name  = variable_struct_exists(_data, "last_room") ? _data.last_room : "rm_overworld";
    var _room_id    = asset_get_index(_room_name);
    _g.last_room_id = (_room_id != -1) ? _room_id : rm_overworld;

    return true;
}
