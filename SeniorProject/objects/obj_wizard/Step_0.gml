/// @description Insert description here
// You can write your code in this editor

if (state == enemy_state.CombatIdle) {
	sprite_index = spr_wizardenemy;
	if (timer == 0) {
		timer = maxtimer;
		state = enemy_state.Attacking;
	} else if (timer > 0) {
		timer -= 1;	
	}

} else if (state == enemy_state.Attacking) {
	sprite_index = spr_wizardenemy_attack;
	if (charge < maxcharge) {
		charge++;
	} else {
		charge = 0;
		var bullet = instance_create_layer(x,y,"lay_bullets",obj_wizardmagic);
		bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
		bullet.speed = 2;
		state = enemy_state.CombatIdle;
	}
}

