// Close upgrade menu with "M" and UNPAUSE
if (keyboard_check_pressed(ord("F")) && can_close) {
    global.paused = false;
    global.just_unpaused = true;
    instance_destroy();       
    exit;
}

can_close = true;

// Count down the button flash timer
if (button_click_timer > 0) {
    button_click_timer -= 1;
    if (button_click_timer == 0) {
        button_click_index = -1; // Reset when timer is done
    }
}

// Message timer
if (upgrade_message_timer > 0) {
    upgrade_message_timer -= 1;
}

// Mouse controls
var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);
var mouse_clicked = mouse_check_button_pressed(mb_left);

// Only run all the mouse-click logic if the mouse was actually clicked
if (mouse_clicked == true) {

    // Helper Functions
    var check_button = function(button_y, mx, my) {
        var x1 = btn_center_x - (btn_width / 2);
	    var y1 = button_y - (btn_height / 2);
	    var x2 = btn_center_x + (btn_width / 2);
	    var y2 = button_y + (btn_height / 2);
	    return point_in_rectangle(mx, my, x1, y1, x2, y2);
    }
    
    var show_feedback = function(text, success) {
        upgrade_message = text;
        upgrade_message_timer = 60;
		if (success) {
			upgrade_message_color = c_lime; // Green for success
		} else {
			upgrade_message_color = c_red; // Red for failure
		}
    }
    
    
    // Button 1: Restore 25 HP
    if (check_button(btn_y_start + (btn_y_spacing * 0), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.hp_restore_cost) { 
            if (player.hitpoints < player.max_hitpoints) {
                global.gems -= global.hp_restore_cost; 
                player.hitpoints += 25; // Restore 25 HP
                if (player.hitpoints > player.max_hitpoints) {
                    player.hitpoints = player.max_hitpoints; // Don't overheal
                }
                show_feedback("Restored 25 HP!", true);
				button_click_index = 0; 
				button_click_timer = 15;
            } else {
                show_feedback("Already at full health!", false);
            }
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 2: Increase Max HP
    else if (check_button(btn_y_start + (btn_y_spacing * 1), mouse_x_gui, mouse_y_gui)) {
        // for the first 10 time(level) the cost to upgrade is 5, after the 10 the cost to upgrade will be 10
		var current_cost = (global.upgrade_levels.hp_max < 10) ? 5 : 10;
        if (global.gems >= current_cost) { 
            global.gems -= current_cost; 
            player.max_hitpoints += 10;
            global.upgrade_levels.hp_max += 1; // Increase level
            show_feedback("Max HP Increased!", true);
			button_click_index = 1; 
            button_click_timer = 15; 
        } else {
            show_feedback("Not enough gems!", false);
         }
    }
    
    // Button 3: Basic Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 2), mouse_x_gui, mouse_y_gui)) {
		// same logic as above, but the first 10 time(level) will cost 1, after that will be 2
        var current_cost = (global.upgrade_levels.basic_dmg < 10) ? 1 : 2;
        if (global.gems >= current_cost) { 
            global.gems -= current_cost; 
            player.basic_stats.damage += 0.3;
            global.upgrade_levels.basic_dmg += 1; // Increase level
            show_feedback("Basic Attack Upgraded!", true);
			button_click_index = 2; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 4: Fireball Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 3), mouse_x_gui, mouse_y_gui)) {
        var current_cost = (global.upgrade_levels.fire_dmg < 10) ? 1 : 2;
        if (global.gems >= current_cost) { 
            global.gems -= current_cost; 
            player.fireball_stats.damage += 0.5;
            global.upgrade_levels.fire_dmg += 1; // Increase level
            show_feedback("Fireball Upgraded!", true);
			button_click_index = 3; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 5: Lightning Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 4), mouse_x_gui, mouse_y_gui)) {
        var current_cost = (global.upgrade_levels.lightning_dmg < 10) ? 1 : 2;
        if (global.gems >= current_cost) { 
            global.gems -= current_cost; 
            player.lightning_stats.damage += 0.5;
            player.lightning_stats.chain_damage += 0.3;
            global.upgrade_levels.lightning_dmg += 1; // Increase level
            show_feedback("Lightning Upgraded!", true);
			button_click_index = 4; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
}