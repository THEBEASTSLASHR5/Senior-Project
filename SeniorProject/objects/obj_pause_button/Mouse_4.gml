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

    // Instead of instance_deactivate_all(true), do this:
    with (all) {
        if (object_index != obj_pause_button && object_index != obj_main_menu) {
            instance_deactivate_object(id);
        }
    }
}
else {
    instance_activate_all();
    if (surface_exists(pausedSurf)) {
        surface_free(pausedSurf);
        pausedSurf = -1;
    }
}
