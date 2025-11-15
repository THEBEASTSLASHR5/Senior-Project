if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_upgrade_menu)) {
    global.paused = !global.paused;

    if (global.paused) {
        //-------------------------------------
        //  Refresh HP *right before pausing*
        //-------------------------------------
        if (instance_exists(asset_get_index("objHPBarTimePause"))) {
            with (asset_get_index("objHPBarTimePause")) {
                // Force an immediate HP update from player
                if (instance_exists(obj_player)) {
                    player_hp = obj_player.hitpoints;
                    player_max_hp = obj_player.max_hitpoints;
                }

                // Now capture those values for pause menu
                global.paused_hp = player_hp;
                global.paused_max_hp = player_max_hp;
            }
        }

        //-------------------------------------
        //  Capture time (already accurate)
        //-------------------------------------
        if (variable_global_exists("game_timer_frames")) {
            global.paused_time = global.game_timer_frames;
        }

        //-------------------------------------
        //  Delay screenshot + freeze
        //-------------------------------------
        alarm[0] = 1;
    }
    else {
        instance_activate_all();
        if (surface_exists(global.pausedSurf)) {
            surface_free(global.pausedSurf);
            global.pausedSurf = -1;
        }
        with (obj_pauseMenu) instance_destroy();
    }
}
