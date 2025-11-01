if (global.paused) {
    // Stop animations and skip movement logic
    image_speed = 0;
    exit;
}
image_speed = 1; // restore animation when unpaused

event_inherited();
if (state == enemy_state.CombatIdle) {
	if (timer == 0) {
		timer = maxtimer;
		mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
		
		state = enemy_state.Attacking;
	} else if (timer > 0) {
		timer -= 1;	
	}

} else if (state == enemy_state.Attacking) {
	mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
	path_start(path, 2, path_action_stop, 0);
	if (distance_to_object(obj_player) = 0)
	{
		audio_play_sound(aud_enemyexplosion, 1, false, global.volume/100);
		instance_create_layer(x, y, "lay_bullets", obj_bomberexplosion);
		instance_destroy();
	}
}