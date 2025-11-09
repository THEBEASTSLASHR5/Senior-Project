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
	path_end();
	sprite_index = spr_wizardenemy_attack;
	if (charge < maxcharge) {
		charge++;
	} else {
		charge = 0;
		audio_play_sound(aud_enemybasicshoot, 1, false, global.volume/100);
		for (var i = 0; i < 3; i++) {
			var bullet = instance_create_layer(x,y,"lay_bullets",obj_wizardmagic);
			bullet.direction = point_direction(x,y,obj_player.x,obj_player.y)+30-(i*30);
			bullet.speed = 2
			bullet.image_blend = c_blue;
		}

		state = enemy_state.CombatIdle;
		
		mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
		path_start(path, 0.5, path_action_stop, 0);
	}
}