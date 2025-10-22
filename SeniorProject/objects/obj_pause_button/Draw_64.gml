/// Draw GUI Event

// Draw frozen frame dim
if (global.paused && surface_exists(pausedSurf)) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    draw_surface_stretched(pausedSurf, 0, 0, gw, gh);
    draw_set_alpha(0.35);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);
}

// Draw the pause/resume icon on-screen
var spr = global.paused ? spr_resume_icon : spr_pause_icon;
draw_sprite_stretched(spr, 0, btn_gx, btn_gy, btn_w, btn_h);
