// --- ESC key toggles pause ---
if (keyboard_check_pressed(vk_escape)) {

    // Toggle the paused state
    global.paused = !global.paused;

    if (global.paused) {

        //-------------------------------------
        // 1. CAPTURE THE GAME BEFORE FREEZING
        //-------------------------------------
        // Wait one frame before freezing to let the surface capture properly
        alarm[0] = 1;

    } else {
        //-------------------------------------
        // UNPAUSE
        //-------------------------------------
        instance_activate_all();

        if (surface_exists(global.pausedSurf)) {
            surface_free(global.pausedSurf);
            global.pausedSurf = -1;
        }

        with (obj_pauseMenu) instance_destroy();
    }
}
