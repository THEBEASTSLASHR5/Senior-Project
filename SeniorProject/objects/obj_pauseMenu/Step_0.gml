var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);

// Check if the left mouse button is clicked
if (mouse_check_button_pressed(mb_left)) {

	// Check for Resume Button
	if (point_in_rectangle(mouse_x_gui, mouse_y_gui, resume_btn_x, resume_btn_y, resume_btn_x + resume_btn_w, resume_btn_y + resume_btn_h)) {

		// UNPAUSE THE GAME 
		global.paused = false;
		instance_activate_all(); 
		instance_destroy();     
	}

	// Check for Main Menu Button
	if (point_in_rectangle(mouse_x_gui, mouse_y_gui, menu_btn_x, menu_btn_y, menu_btn_x + menu_btn_w, menu_btn_y + menu_btn_h)) {

		// GO TO MAIN MENU 
		global.paused = false;
		instance_activate_all(); 
		room_goto(rm_start); 
		instance_destroy();
	}
if (mouse_check_button_pressed(mb_left)) {
    // Get mouse position in GUI coordinates
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
}
	// Exit to Settings
    if (mx > settings_btn_x && mx < settings_btn_x + settings_btn_w &&
        my > settings_btn_y && my < settings_btn_y + settings_btn_h) {
			draw_set_font(-1); // resets to default font
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

        room_goto(rm_settings);
		}
}