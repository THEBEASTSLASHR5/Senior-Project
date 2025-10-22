// Stop drawing if paused
if (global.paused) {
    exit;
}

// Stop drawing if the player doesn't exist
if (!instance_exists(obj_player)) {
    exit;
}

// Draw Skill Cooldowns
var current_x = skill_start_x;

// Loop 3 times (for 0, 1, 2)
for (var i = 0; i < 3; i++) {
    var attack_type = i; // The enum value (0, 1, 2)
    var icon_sprite = ds_map_find_value(skill_sprites, attack_type);
    
    // Draw Box Sprite
    var box_color = c_white;
    if (obj_player.attack_selected == attack_type) {
        box_color = c_lime; // Highlight it green if selected
    }
    
    draw_sprite_stretched_ext(
	spr_ui_elements_sheet, 0, current_x, skill_start_y, skill_icon_size, skill_icon_size, box_color, 1);
    
    
    // Draw the Icon
    var box_center_x = current_x + (skill_icon_size / 2);
    var box_center_y = skill_start_y + (skill_icon_size / 2);
    var icon_scale = 2.5; 

    // sprite scaled up
    draw_sprite_ext(icon_sprite, 0, box_center_x, box_center_y, icon_scale, icon_scale, 0, c_white, 1);
	 
    // Get Cooldown Progress
    var current_timer = 0;
    var max_timer = 1;
    
    switch (attack_type) {
        case 0: // basic
            current_timer = obj_player.basic_stats.current_cooldown;
            max_timer = obj_player.basic_stats.cooldown_max;
            break;
        case 1: // fireBall
            current_timer = obj_player.fireball_stats.current_cooldown;
            max_timer = obj_player.fireball_stats.cooldown_max;
            break;
        case 2: // lightning
            current_timer = obj_player.lightning_stats.current_cooldown;
            max_timer = obj_player.lightning_stats.cooldown_max;
            break;
    }
    
    var cooldown_ratio = current_timer / max_timer;
    
    
    // Draw Cooldown Overlay AND Text
    if (cooldown_ratio > 0) {
        // Draw the dark overlay
        draw_set_color(c_black);
        draw_set_alpha(0.7);
        var overlay_height = skill_icon_size * cooldown_ratio;
        var overlay_y_pos = skill_start_y + skill_icon_size - overlay_height;
        draw_rectangle(current_x, overlay_y_pos, current_x + skill_icon_size, skill_start_y + skill_icon_size, false);
        draw_set_alpha(1.0);
        
        // Draw Cooldown Text
        var remaining_seconds = current_timer / game_get_speed(gamespeed_fps);
        var text_to_draw = string_format(remaining_seconds, 1, 1); 
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_set_font(fnt_GUI);
        draw_text(box_center_x, box_center_y, text_to_draw);
    } 
    // Move to the next position
    current_x += skill_icon_size + skill_padding;
}

// Reset drawing settings
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


// Draw Feedback Text
if (feedback_timer > 0) {
    feedback_timer -= 1; // Count down the timer
     
    // Fade out time
    var alpha = feedback_timer / 60; 
    
    // Calculate position
    var screen_cx = display_get_gui_width() / 2;
    var screen_cy = display_get_gui_height() / 2;
    
    // Calculate position (float up from center)
    var y_pos = screen_cy - ( (60 - feedback_timer) * 0.5 );
    var x_pos = screen_cx;
    
    // Set font and alignment
    draw_set_font(fnt_GUI);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Draw the text with the fade
    draw_text_color(x_pos, y_pos, feedback_text, c_white, c_white, c_white, c_white, alpha);
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}