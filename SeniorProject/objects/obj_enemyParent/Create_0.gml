hitpoints = 8;
max_hitpoints = 8;

enum enemy_state { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	Roam,
	CombatIdle,
	Attacking,
}

state = enemy_state.CombatIdle;

instance_create_layer(x, y, "lay_bullets", obj_entranceSmoke);
path = path_add();
