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
		var bullet = instance_create_layer(x,y,"lay_bullets",obj_wizardmagic);
		bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
		bullet.speed = 2;
		
		mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
		path_start(path, 0.5, path_action_stop, 0);
		state = enemy_state.CombatIdle;
	}
}