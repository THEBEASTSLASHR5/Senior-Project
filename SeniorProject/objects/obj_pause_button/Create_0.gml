/// Create Event
if (!variable_global_exists("paused")) global.paused = false;
pausedSurf = -1;
sprite_index = spr_pause_icon;
btn_w = 125;
btn_h = 125;

// GUI coordinates (where on screen)
btn_gx = 515;
btn_gy = 2;
