/// Draw GUI Event for the pause/resume button

// Draw the frozen frame first
if (global.paused && surface_exists(pausedSurf)) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    draw_surface_stretched(pausedSurf, 0, 0, gw, gh);

    // dim overlay
    draw_set_alpha(0.35);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);
}

// --- draw the pause/resume icon at a fixed GUI size and position ---
var icon_w = 125;   // width in GUI pixels
var icon_h = 125;   // height in GUI pixels
var gx = 515; // X position on the GUI
var gy = 2;   // Y position on the GUI

// decide which sprite to use
var spr = global.paused ? spr_resume_icon : spr_pause_icon;

// draw the sprite scaled to our fixed size
draw_sprite_stretched(spr, 0, gx, gy, icon_w, icon_h);
