// Pause Input
// Listen for the Escape key
if (keyboard_check_pressed(vk_escape)) {
	
	if (global.paused == false) {
		// PAUSE THE GAME
		global.paused = true;
		
		// Capture the current stats 
		global.paused_hp = player_hp;
		global.paused_max_hp = player_max_hp;
		global.paused_time = global.game_timer_frames;
		
		instance_deactivate_all(true);
		    		
		// Create the pause menu
		instance_create_layer(0, 0, "Instances", obj_pauseMenu);
		
	}
}
// Do not run game logic if paused 
// This stops the timer and HP updates when the pause menu is open
if (global.paused) {
	exit;
}

// Update the game timer
global.game_timer_frames += 1;

if (instance_exists(obj_player)){
	player_hp = obj_player.hitpoints;
	player_max_hp = obj_player.max_hitpoints;
}
else{
	player_hp = 0;
}

