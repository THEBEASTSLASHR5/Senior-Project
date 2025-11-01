velocity = 0;
dir_angle = 0;
max_velocity = 2;
rolltimer = 0;
hitpoints = 50;
max_hitpoints = 50;
totaldistancewalked = 0;

player_Wand = instance_create_layer(x, y, "lay_player", obj_wand);


basic_stats = {
    cooldown_max: 10,
    current_cooldown: 0
}

fireball_stats = {
    cooldown_max: 150,
    current_cooldown: 0
}

lightning_stats = {
    cooldown_max: 150,
    current_cooldown: 0
}

enum attack_type { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	basic,
	fireBall,
	lightning,
}

attack_selected = attack_type.basic;