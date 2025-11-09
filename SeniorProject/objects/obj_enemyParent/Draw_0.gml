// Draw HP bar above enemy
draw_self();

var bar_width = 15; // Width of the hp bar
var bar_height = 0.5;  // Height of the hp bar
// Position above the head 
var bar_x = x - (bar_width / 2);
var bar_y = bbox_top - bar_height - 4;

// Calculate HP percentage
var hp_percent = hitpoints / max_hitpoints;
if (hp_percent < 0) { 
    hp_percent = 0; 
}
// red background
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

//green health 
draw_set_color(c_lime); 
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_percent), bar_y + bar_height, false);

draw_set_color(c_white);