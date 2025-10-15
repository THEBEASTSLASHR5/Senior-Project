var x_padding = 10; // How many pixels from the LEFT edge of the screen.
var y_padding = -20; // How many pixels from the TOP edge of the screen.
var scale = 3.5;    // The size of the bar. 1.0 is 100%, 0.75 is 75%.

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

// Draw the sprite with the new position and scale
draw_sprite_ext(sprHPBar, frame_to_draw, x_pos, y_pos, scale, scale, 0, c_white, 1);