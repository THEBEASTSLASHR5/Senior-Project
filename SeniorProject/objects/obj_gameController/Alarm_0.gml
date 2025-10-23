// Capture screenshot
if (surface_exists(application_surface)) {
    if (surface_exists(global.pausedSurf)) surface_free(global.pausedSurf);
    var w = surface_get_width(application_surface);
    var h = surface_get_height(application_surface);
    global.pausedSurf = surface_create(w, h);
    surface_set_target(global.pausedSurf);
    draw_clear_alpha(c_black, 0);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
}

// Freeze gameplay
instance_deactivate_all(true);
instance_activate_object(obj_gameController);
instance_create_layer(0, 0, "GUI", obj_pauseMenu);
