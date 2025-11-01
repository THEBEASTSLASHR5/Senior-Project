if (global.paused) {
    // Stop animations and skip movement logic
    image_speed = 0;
    exit;
}
image_speed = 1; // restore animation when unpaused


//Player Input
depth = -y;
var move_right = keyboard_check(ord("D"));
var move_down = keyboard_check(ord("S"));
var move_left = keyboard_check(ord("A"));
var move_up = keyboard_check(ord("W"));
var roll = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_shift);
var attack = mouse_check_button_pressed(mb_left);
var altattack = mouse_check_button_pressed(mb_right);
var weapon1 = keyboard_check_pressed(ord("1"));
var weapon2 = keyboard_check_pressed(ord("2"));
var weapon3 = keyboard_check_pressed(ord("3"));

if (weapon1) {	//Switch between weapons
	attack_selected = attack_type.basic;
} else if (weapon2) {
	attack_selected = attack_type.fireBall;
} else if (weapon3) {
	attack_selected = attack_type.lightning;
}



var theta = (point_direction(x, y, mouse_x, mouse_y)); //Get angle to mouse, convert to radians.
var thetaInRadians = theta * ((2*pi)/360);

//show_debug_message(thetaInRadians);
player_Wand.x = x + 10 * cos(thetaInRadians);	//Move wand position.
player_Wand.y = y - 10 * sin(thetaInRadians);

if (thetaInRadians >= pi) {		//Show wand in front of player when at specific angle.
	player_Wand.depth = layer_get_depth("lay_player")-1;
} else {
	player_Wand.depth = layer_get_depth("lay_wand_back");	
}




if (roll == true) && (rolltimer == 0) {	//Roll
	rolltimer = 20;
	audio_play_sound(aud_playerroll, 1, false, global.volume/100);
}

if (rolltimer > 0) {
	sprite_index = spr_playerroll;
	max_velocity = 2;
	rolltimer -= 1;
	image_blend = c_aqua;
} else {
	sprite_index = spr_playerwalk;
	max_velocity = 1;
}

// hit flash
if (hit_flash_timer > 0) {
	hit_flash_timer -= 1;
	image_blend = c_red; // Force red if flashing
} else if (rolltimer > 0) {
	image_blend = c_aqua; // If not flashing, check for roll
} else {
	image_blend = c_white; // Otherwise, be normal
}


if (move_right == true) {	//Swap facing direction
	image_xscale = 1;	
} else if (move_left == true) {
	image_xscale = -1;
}

//Movement
if (move_right == true || move_down == true || move_left == true || move_up == true) {
	velocity = max_velocity;	
} else {
	velocity = 0;
}


dir_angle = arctan2(move_up-move_down,move_right-move_left);
var hspd = velocity * cos(dir_angle); // Horizontal speed
var vspd = -velocity * sin(dir_angle); // vertical speed

// Horizontal collision check
if (place_meeting(x + hspd, y, objWall)) {
	while (!place_meeting(x + sign(hspd), y, objWall)) {
		x += sign(hspd);
	}
	hspd = 0;
}
x += hspd; // Apply horizontal movement

// Vertical collision check
if (place_meeting(x, y + vspd, objWall)) {
	while (!place_meeting(x, y + sign(vspd), objWall)) {
		y += sign(vspd);
	}
	vspd = 0;
}
y += vspd; // Apply vertical movement

if (abs(hspd)+abs(vspd)>0 && rolltimer == 0) {
	totaldistancewalked += 10;	
}
if (totaldistancewalked % 200 == 190) {	//Footstep Sounds
	audio_play_sound(aud_playerfootstep, 1, false, global.volume/50);
}

if (velocity == 0) {
	sprite_index = spr_playerstand;
}

if (attack == true) {	//Attack based on selected weapon type
	var attack_fired = false; // track if we attacked

    // Check for attacks
    if (attack_selected == attack_type.basic && basic_stats.current_cooldown <= 0) {
        // Attack succeeded
        basic_stats.current_cooldown = basic_stats.cooldown_max;
        instance_create_layer(x, y, "lay_bullets", obj_basicMagic, {speed: 3, direction: theta});
        attack_fired = true;
		audio_play_sound(aud_playerbasicattack, 1, false, global.volume/100);
    }
    else if (attack_selected == attack_type.fireBall && fireball_stats.current_cooldown <= 0) {
        fireball_stats.current_cooldown = fireball_stats.cooldown_max;
        instance_create_layer(x, y, "lay_bullets", obj_fireBallMagic, {speed: 3, direction: theta});
        attack_fired = true;
		audio_play_sound(aud_playerfireballattack, 1, false, global.volume/100);
    }
    else if (attack_selected == attack_type.lightning && lightning_stats.current_cooldown <= 0) {
        lightning_stats.current_cooldown = lightning_stats.cooldown_max;
        instance_create_layer(x, y, "lay_bullets", obj_lightningbolt, {image_angle: theta, speed: 3, direction: theta, original: true});
        attack_fired = true;
		audio_play_sound(aud_playerlightningattack, 1, false, global.volume/100);
    }

    // Check for FAILED attacks
    // If pressed attack but nothing fired, show the cooldown message
    if (attack_fired == false && instance_exists(obj_skillUI) && obj_skillUI.feedback_timer <= 0) {
        obj_skillUI.feedback_timer = 60; // Show message for 1 second
        obj_skillUI.feedback_text = "RECHARGING...";
    }
}

// Cooldown Timers
if (basic_stats.current_cooldown > 0) {
	basic_stats.current_cooldown -= 1;
}
if (fireball_stats.current_cooldown > 0) {
	fireball_stats.current_cooldown -= 1;
}
if (lightning_stats.current_cooldown > 0) {
	lightning_stats.current_cooldown -= 1;
}

var bullet_collide = instance_place(x,y,obj_bulletparent);
if (bullet_collide != noone && rolltimer <= 0) {
	if (bullet_collide.disable == false) {
		audio_play_sound(aud_playerdamage, 1, false, global.volume/100);
		hitpoints -= bullet_collide.damage;
		hit_flash_timer = 7;
		bullet_collide.disable = true;
		instance_destroy(bullet_collide);
	}
}

if (hitpoints <= 0) {
	game_restart();	
}

