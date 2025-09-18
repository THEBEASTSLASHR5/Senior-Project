/// @description Insert description here
// You can write your code in this editor
maxtimer = 120;
timer = maxtimer;
charge = 0;
maxcharge = 60;

enum enemy_state { //https://gamemaker.io/en/blog/hacking-stronger-enums-into-gml
	Roam,
	CombatIdle,
	Attacking,
}

state = enemy_state.CombatIdle;