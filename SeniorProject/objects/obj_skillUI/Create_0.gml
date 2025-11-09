// Skill Cooldown UI Settings
skill_icon_size = 80; 
skill_padding = 10;   

// Position the UI at the bottom-left of the screen
var padding_from_edge = 20;
skill_start_x = padding_from_edge;
skill_start_y = display_get_gui_height() - skill_icon_size - padding_from_edge;

// Map attack types (0, 1, 2) to their sprites
skill_sprites = ds_map_create();

ds_map_add(skill_sprites, 0, spr_basicMagic); // 0 = attack_type.basic
ds_map_add(skill_sprites, 1, spr_fireBallMagic); // 1 = attack_type.fireBall
ds_map_add(skill_sprites, 2, spr_lightningbolt); // 2 = attack_type.lightning


feedback_text = "";
feedback_timer = 0;