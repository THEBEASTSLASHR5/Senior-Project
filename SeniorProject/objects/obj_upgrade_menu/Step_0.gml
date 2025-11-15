// Close upgrade menu with "M" and UNPAUSE
if (keyboard_check_pressed(ord("M")) && can_close) {
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
    
    
    // Button 1: Restore HP
    if (check_button(btn_y_start + (btn_y_spacing * 0), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.upgrade_costs.hp_restore) { 
            if (player.hitpoints < player.max_hitpoints) {
                global.gems -= global.upgrade_costs.hp_restore; 
                player.hitpoints = player.max_hitpoints;
                show_feedback("Health Restored!", true);
				button_click_index = 0; 
				button_click_timer = 15; // Flash for 15 frames
            } else {
                show_feedback("Already at full health!", false);
            }
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 2: Increase Max HP
    else if (check_button(btn_y_start + (btn_y_spacing * 1), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.upgrade_costs.hp_max) { 
            global.gems -= global.upgrade_costs.hp_max; 
            player.max_hitpoints += 10;
            global.upgrade_costs.hp_max += 5;
            show_feedback("Max HP Increased!", true);
			button_click_index = 1; 
            button_click_timer = 15; 
        } else {
            show_feedback("Not enough gems!", false);
         }
    }
    
    // Button 3: Basic Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 2), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.upgrade_costs.basic_dmg) { 
            global.gems -= global.upgrade_costs.basic_dmg; 
            player.basic_stats.damage += 1;
            global.upgrade_costs.basic_dmg += 2;
            show_feedback("Basic Attack Upgraded!", true);
			button_click_index = 2; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 4: Fireball Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 3), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.upgrade_costs.fire_dmg) { 
            global.gems -= global.upgrade_costs.fire_dmg; 
            player.fireball_stats.damage += 2;
            global.upgrade_costs.fire_dmg += 2; 
            show_feedback("Fireball Upgraded!", true);
			button_click_index = 3; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
    
    // Button 5: Lightning Damage
    else if (check_button(btn_y_start + (btn_y_spacing * 4), mouse_x_gui, mouse_y_gui)) {
        if (global.gems >= global.upgrade_costs.lightning_dmg) { 
            global.gems -= global.upgrade_costs.lightning_dmg; 
            player.lightning_stats.damage += 1;
            player.lightning_stats.chain_damage += 1;
            global.upgrade_costs.lightning_dmg += 2; 
            show_feedback("Lightning Upgraded!", true);
			button_click_index = 4; 
			button_click_timer = 15;
        } else {
            show_feedback("Not enough gems!", false);
        }
    }
}