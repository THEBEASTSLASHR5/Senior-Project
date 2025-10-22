if (global.paused) {
    exit;
}
// Draw Game Timer
// Calculate time
var total_frames = global.game_timer_frames;
var total_seconds = floor(total_frames / game_get_speed(gamespeed_fps));
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60; // Get the remaining seconds

var seconds_string = string(seconds);
if (seconds < 10) {
    seconds_string = "0" + seconds_string;
}

var timer_string = string(minutes) + ":" + seconds_string;

draw_set_font(fnt_GUI);     
draw_set_color(c_white);
draw_set_halign(fa_center); // Center the text horizontally
draw_set_valign(fa_top);    // Align to the top

var screen_width = display_get_gui_width();
draw_text(screen_width / 2, 20, timer_string);

draw_set_halign(fa_left);
//


//Draw Game HP Bar
var x_padding = 10; // How many pixels from the LEFT edge of the screen.
var y_padding = -20; // How many pixels from the TOP edge of the screen.
var scale = 3.5;  

// Set the position directly from the top-left corner
var x_pos = x_padding;
var y_pos = y_padding;

// Calculate which frame of the health bar to show 
var total_health_frames = 10;
var frame_to_draw = 0;

if (player_hp <= 0) {
    frame_to_draw = 10;
} else {
    var hp_percent = player_hp / player_max_hp;
    frame_to_draw = floor((1 - hp_percent) * total_health_frames);
}

draw_sprite_ext(sprHPBar, frame_to_draw, x_pos, y_pos, scale, scale, 0, c_white, 1);
//

