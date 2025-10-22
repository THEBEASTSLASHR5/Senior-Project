/// Step Event

// Get mouse position in GUI space
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Button bounds in GUI coordinates
var bx1 = btn_gx;
var by1 = btn_gy;
var bx2 = bx1 + btn_w;
var by2 = by1 + btn_h;

// Check for click inside the GUI button
if (mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(mx, my, bx1, by1, bx2, by2)) {

    // --- Toggle pause state ---
    global.paused = !global.paused;
    sprite_index = global.paused ? spr_resume_icon : spr_pause_icon;

    // --- Audio ---
    if (global.paused) audio_pause_all(); else audio_resume_all();

    // --- Frozen frame screenshot ---
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
        instance_deactivate_all(true);
        instance_activate_object(id); // keep button active
    } else {
        instance_activate_all();
        if (surface_exists(pausedSurf)) { surface_free(pausedSurf); pausedSurf = -1; }
    }
}
