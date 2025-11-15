// Draw dark overlay
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, gui_width, gui_height, false);
draw_set_alpha(1.0);
draw_set_color(c_white);

// Draw main window sprite
var draw_x = center_x - (window_width / 2);
var draw_y = center_y - (window_height / 2);

draw_sprite_stretched(spr_upgrade_window, 0, draw_x, draw_y, window_width, window_height);

// Set font and alignment
draw_set_font(fnt_GUI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_maroon);

// Draw Title
draw_text(center_x, center_y - 230, "UPGRADES");

// Draw Gem Count
draw_set_color(c_aqua);
draw_text(center_x, center_y - 180, "Gems: " + string(global.gems));
draw_set_color(c_black);

// Function to draw the buttons
var draw_button_text = function(button_y, text, cost) {
    // Draw the Label
    draw_set_halign(fa_left); // Align text to the left
    draw_set_valign(fa_middle);
	draw_set_color(c_black);
    var label_x = center_x - (window_width / 2) + 100; // 100px from left edge of window
    draw_text(label_x, button_y, text); 

    // Calculate the top-left corner for the button sprite
    var sprite_draw_x = btn_center_x - (btn_width / 2);
    var sprite_draw_y = button_y - (btn_height / 2);
	
	var current_button_index = round((button_y - btn_y_start) / btn_y_spacing);
    var button_tint = c_white; // Default color

    if (button_click_index == current_button_index && button_click_timer > 0) {
        button_tint = c_gray; // Tint it gray if clicked
    }

    // Draw the button sprite
    draw_sprite_stretched_ext(
        spr_upgrade_button, 
        0, 
        sprite_draw_x, // Use calculated top-left X
        sprite_draw_y, // Use calculated top-left Y
        btn_width, 
        btn_height,
		button_tint,
		1
    );

    // Draw the cost text on top of the button
    draw_set_halign(fa_center); // Align text to the center
    draw_set_valign(fa_middle);
	draw_set_color(c_yellow);
    draw_text(btn_center_x, button_y, "Cost: " + string(cost));
	
}

// Draw all 5 buttons
draw_button_text(btn_y_start + (btn_y_spacing * 0), "Restore HP", global.upgrade_costs.hp_restore);
draw_button_text(btn_y_start + (btn_y_spacing * 1), "Increase Max HP", global.upgrade_costs.hp_max);
draw_button_text(btn_y_start + (btn_y_spacing * 2), "Upgrade Basic", global.upgrade_costs.basic_dmg);
draw_button_text(btn_y_start + (btn_y_spacing * 3), "Upgrade Fireball", global.upgrade_costs.fire_dmg);
draw_button_text(btn_y_start + (btn_y_spacing * 4), "Upgrade Lightning", global.upgrade_costs.lightning_dmg);

// Draw feedback message
if (upgrade_message_timer > 0) {
    draw_set_color(upgrade_message_color);
    draw_text(center_x, center_y + 180, upgrade_message);
}

// Draw "Close" hint
draw_set_color(c_white);
draw_text(center_x, center_y + 220, "Press 'F' to close");

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);