if (global.paused) {
    // Stop animations and skip movement logic
    image_speed = 0;
    exit;
}
image_speed = 1; // restore animation when unpaused

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
		audio_play_sound(aud_earthrise, 1, false, global.volume/100);
		charge = 0;
		var bullet = instance_create_layer(obj_player.x,obj_player.y+6,"lay_player",obj_earthRiser_Warning);
		state = enemy_state.CombatIdle;
	}
}