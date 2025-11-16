can_close = false;

player = obj_player;

// Menu setup
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
center_x = gui_width / 2;
center_y = gui_height / 2;

// Define button positions
btn_y_start = center_y - 120; // Y position of the first button
btn_y_spacing = 60;   // Pixels between each button
btn_width = 170;      // Width of the button sprite
btn_height = 55;       // Height of the button sprite

btn_center_x = center_x + 180;

// Feedback message
upgrade_message = "";
upgrade_message_timer = 0;
upgrade_message_color = c_red;

window_width = 800; // The width you want for the window
window_height = 600; // The height you want

button_click_index = -1; // Which button is flashing (-1 = none)
button_click_timer = 0;  // How long the flash lasts