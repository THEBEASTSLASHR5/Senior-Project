var current_alpha = image_alpha;

// Shadow settings
var shadow_offset_x = 0.9; // x position
var shadow_offset_y = 7; // y position
var shadow_scale_x = 0.6; // how big of the shadow horizontally
var shadow_scale_y = 0.3; // how big of the shadow vertically
var shadow_size = sprite_get_width(sprite_index) * image_xscale;

// Draw the shadow
draw_set_color(c_black);
draw_set_alpha(current_alpha * 0.7); // transparent setting

draw_ellipse(
    x + shadow_offset_x - (shadow_size * shadow_scale_x / 2), 
    start_y + shadow_offset_y - (shadow_size * shadow_scale_y / 2),
    x + shadow_offset_x + (shadow_size * shadow_scale_x / 2),
    start_y + shadow_offset_y + (shadow_size * shadow_scale_y / 2),
    false
);

// Reset alpha and color
draw_set_alpha(1.0);
draw_set_color(c_white);


// Draw the Gem 
draw_sprite_ext(
    sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha
);