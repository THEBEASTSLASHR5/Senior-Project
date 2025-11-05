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


// Draw HP text and Gem Counter
var ui_start_x = 100; 
var ui_start_y = 110; 
var padding = 20;    
var gem_icon_scale = 2.5; 

// Draw HP text
draw_set_font(fnt_GUI);
draw_set_color(c_lime);
draw_set_halign(fa_left);
draw_set_valign(fa_middle); 
var hp_string = "HP: " + string(obj_player.hitpoints) + "/" + string(obj_player.max_hitpoints);
draw_text(ui_start_x, ui_start_y, hp_string);

// Gem Icon's position
var hp_text_width = string_width(hp_string);
var icon_w_scaled = sprite_get_width(spr_gem) * gem_icon_scale;

var icon_center_x = ui_start_x + hp_text_width + padding + (icon_w_scaled / 2);
var icon_center_y = ui_start_y; 

// Draw gem icon 
draw_sprite_ext(
    spr_gem, 0,icon_center_x,icon_center_y,gem_icon_scale,gem_icon_scale,0,c_white,1);

// Draw gem text
draw_set_valign(fa_middle);
draw_set_font(fnt_GUI);
draw_set_color(c_aqua);

var gem_text = ": " + string(global.gems);
var text_x = icon_center_x + (icon_w_scaled / 2) + 5;
draw_text(text_x, ui_start_y, gem_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
//