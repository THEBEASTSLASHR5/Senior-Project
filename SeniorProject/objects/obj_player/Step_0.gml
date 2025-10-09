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
}

if (rolltimer > 0) {
	sprite_index = spr_playerroll;
	max_velocity = 2;
	rolltimer -= 1;
	image_blend = c_aqua;
} else {
	sprite_index = spr_playerwalk;
	max_velocity = 1;
	image_blend = c_white;
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
x += velocity*cos(dir_angle);
y -= velocity*sin(dir_angle);

if (velocity == 0) {
	sprite_index = spr_playerstand;
}

if (attack == true && attackCooldown <= 0) {	//Attack based on selected weapon type
	if (attack_selected == attack_type.basic) {
		attackCooldownMax = 10;
		instance_create_layer(x, y, "lay_bullets", obj_basicMagic, {speed: 3, direction: theta});
	}
	if (attack_selected == attack_type.fireBall) {
		attackCooldownMax = 20;
		instance_create_layer(x, y, "lay_bullets", obj_fireBallMagic, {speed: 3, direction: theta});
	}
	if (attack_selected == attack_type.lightning) {
		attackCooldownMax = 30;
		instance_create_layer(x, y, "lay_bullets", obj_lightningbolt, {image_angle: theta, speed: 3, direction: theta, original: true});
	}
	attackCooldown = attackCooldownMax;
}

if (attackCooldown > 0) {
	attackCooldown -= 1;	
}


var bullet_collide = instance_place(x,y,obj_bulletparent);
if (bullet_collide != noone && rolltimer <= 0) {
	if (bullet_collide.disable == false) {
		hitpoints -= bullet_collide.damage;
		bullet_collide.disable = true;
		instance_destroy(bullet_collide);
	}
}

if (hitpoints == 0) {
	game_restart();	
}