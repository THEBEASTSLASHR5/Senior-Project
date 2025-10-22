draw_set_font(fnt_GUI);
draw_set_color(c_lime);
draw_text(100, 100, "HP: " + string(obj_player.hitpoints) + "/" + string(obj_player.max_hitpoints));