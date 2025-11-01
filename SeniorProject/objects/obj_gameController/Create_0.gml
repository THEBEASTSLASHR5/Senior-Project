// --- Initialize pause variables ---
global.paused = false;
global.pausedSurf = -1;

// --- Safely initialize display stats ---

var hpObj = asset_get_index("objHPBarTimePause");

if (instance_exists(hpObj)) {
    with (hpObj) {
        if (variable_instance_exists(id, "player_hp")) {
            global.paused_hp = player_hp;
        } else {
            global.paused_hp = 0;
        }

        if (variable_instance_exists(id, "player_max_hp")) {
            global.paused_max_hp = player_max_hp;
        } else {
            global.paused_max_hp = 0;
        }
    }
} else {
    global.paused_hp = 0;
    global.paused_max_hp = 0;
}

// Safely grab timer
if (variable_global_exists("game_timer_frames")) {
    global.paused_time = global.game_timer_frames;
} else {
    global.paused_time = 0;
}

global.volume = 50;