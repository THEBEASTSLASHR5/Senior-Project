/// @description Insert description here
// You can write your code in this editor
timer = 120;
charge = 0;
maxcharge = 30;

enum enemy_state { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	Roam,
	CombatIdle,
	Attacking,
}

state = enemy_state.CombatIdle;