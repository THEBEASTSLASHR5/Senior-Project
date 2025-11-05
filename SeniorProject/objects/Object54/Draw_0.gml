// Check if mouse is over this button
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
    hovered = true;
} else {
    hovered = false;
}

// If hovered, draw the green-tinted version
if (hovered) {
    // Draw the original button
    draw_self();

    // Add the green tint directly over the object
    draw_set_color(make_color_rgb(0, 255, 0)); // bright green tint
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, make_color_rgb(0, 255, 0), 0.25);
    draw_set_color(c_white);
} else {
    draw_self(); // draw normal
}
