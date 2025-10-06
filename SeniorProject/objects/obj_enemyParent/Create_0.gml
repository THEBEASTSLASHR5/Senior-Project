hitpoints = 10;

enum enemy_state { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	Roam,
	CombatIdle,
	Attacking,
}

state = enemy_state.CombatIdle;