var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

// Draw a dark background 
draw_set_color(c_black);
draw_set_alpha(0.5); // 50% transparent
draw_rectangle(0, 0, screen_w, screen_h, false);
draw_set_alpha(1.0); // Reset alpha


// Set up font for drawing 
draw_set_font(fnt_GUI); 
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

// Draw Title
draw_set_color(c_white);
draw_text(screen_w / 2, screen_h / 2 - 100, "PAUSED");


// Draw Paused Stats
// Draw HP
draw_set_color(c_lime);
var hp_string = "HP: " + string(global.paused_hp) + "/" + string(global.paused_max_hp);
draw_text(screen_w / 2, screen_h / 2 - 50, hp_string);

// Draw Time
draw_set_color(c_white);
var total_seconds = floor(global.paused_time / game_get_speed(gamespeed_fps));
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60;
var seconds_string = string(seconds);
if (seconds < 10) {
	seconds_string = "0" + seconds_string;
}
var timer_string = string(minutes) + ":" + seconds_string;
draw_text(screen_w / 2, screen_h / 2 - 10, timer_string);


// Draw Resume Button
draw_set_color(c_white);
draw_text(resume_btn_x + (resume_btn_w / 2), resume_btn_y + (resume_btn_h / 2), "RESUME");

// Draw Main Menu Button
draw_set_color(c_white);
draw_text(menu_btn_x + (menu_btn_w / 2), menu_btn_y + (menu_btn_h / 2), "MAIN MENU");


// Reset alignment 
draw_set_halign(fa_left);
draw_set_valign(fa_top);