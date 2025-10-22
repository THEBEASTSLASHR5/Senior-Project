/// Step Event

// Get mouse in GUI coordinates
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Button bounds
var bx1 = btn_gx;
var by1 = btn_gy;
var bx2 = bx1 + btn_w;
var by2 = by1 + btn_h;

// Click detection in GUI space
if (mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(mx, my, bx1, by1, bx2, by2)) {

    // Optional: play click sound
    // audio_play_sound(snd_click, 1, false);

    // Go back to the main menu room
    room_goto(rm_start);
}
