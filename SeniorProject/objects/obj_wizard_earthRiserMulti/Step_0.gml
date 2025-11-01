event_inherited();
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
		audio_play_sound(aud_earthrise, 1, false, global.volume/100);
		for (var i = 0; i < 5; i++) {
			var negposx = choose(-1, 1);
			var negposy = choose(-1, 1);
			var bullet = instance_create_layer(obj_player.x+(negposx*irandom_range(10, 30)),obj_player.y+6+(negposy*irandom_range(10, 30)),"lay_player",obj_earthRiser_Warning);
		}
		state = enemy_state.CombatIdle;
	}
}