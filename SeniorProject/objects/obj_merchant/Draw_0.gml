draw_self();

//Check if the player is close
if (instance_exists(obj_player)) {
    
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (dist < 48) {
        
        var prompt_text = "Press [F] to Shop";
        var font_scale = 0.3; // 0.3 = 30% size
        
        // font properties
        var draw_x = x;
        var draw_y = bbox_top - 10; // 1 pixels above the sprite
        
        draw_set_font(fnt_GUI);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        
        //Draw the text
        draw_text_transformed(
            draw_x,
            draw_y,
            prompt_text,
            font_scale, // xscale
            font_scale, // yscale
            0        
        );
        
        // Reset alignment
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}