if (global.just_unpaused == true) {
    global.just_unpaused = false; // Reset the flag
    exit;
}


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

// Check for Upgrade Menu (M)
if (keyboard_check_pressed(ord("M"))) {
	if (global.paused == false) {
		// PAUSE THE GAME
		global.paused = true;
		
    	global.paused_hp = player_hp;
    	global.paused_max_hp = player_max_hp;
    	global.paused_time = global.game_timer_frames;
		
		// Create the upgrade menu
		instance_create_layer(0, 0, "Instances", obj_upgrade_menu);
	}
}



// Do not run game logic if paused 
if (global.paused) {
	exit;
}

// (This code only runs if the game is not paused)
// Update the game timer
global.game_timer_frames += 1;

if (instance_exists(obj_player)){
	player_hp = obj_player.hitpoints;
	player_max_hp = obj_player.max_hitpoints;
}
else{
	player_hp = 0;
}