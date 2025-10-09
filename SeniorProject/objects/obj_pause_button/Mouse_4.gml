// --- Pause Button : Left Pressed ---

// Make sure the global flag exists
if (!variable_global_exists("paused")) global.paused = false;

// Flip state
global.paused = !global.paused;

// --- change the icon immediately so it shows while paused ---
if (global.paused)
    sprite_index = spr_resume_icon;  // turn this same object into the resume icon
else
    sprite_index = spr_pause_icon;   // back to pause icon

// --- handle audio ---
if (global.paused) audio_pause_all(); else audio_resume_all();

// --- keep the scene visible (screenshot) ---
if (global.paused) {
    if (surface_exists(application_surface)) {
        if (surface_exists(pausedSurf)) surface_free(pausedSurf);
        var w = surface_get_width(application_surface);
        var h = surface_get_height(application_surface);
        pausedSurf = surface_create(w, h);
        surface_set_target(pausedSurf);
        draw_clear_alpha(c_black, 0);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
    }

    instance_deactivate_all(true); // keep only THIS instance active so we can click it again
}
else {
    instance_activate_all();
    if (surface_exists(pausedSurf)) { surface_free(pausedSurf); pausedSurf = -1; }
}
