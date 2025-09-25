velocity = 0;
dir_angle = 0;
max_velocity = 2;
rolltimer = 0;
hitpoints = 300;

player_Wand = instance_create_layer(x, y, "lay_player", obj_wand);


enum attack_type { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	basic,
	fireBall,
	lightning,
}

attack_selected = attack_type.basic;