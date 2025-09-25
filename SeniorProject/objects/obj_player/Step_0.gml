//Player Input
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



if (roll == true) && (rolltimer == 0) {	//Roll
	rolltimer = 20;
}

if (rolltimer > 0) {
	sprite_index = spr_playerroll;
	max_velocity = 2;
	rolltimer -= 1;
} else {
	sprite_index = spr_playerwalk;
	max_velocity = 1;
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

if (attack == true) {	//Attack based on selected weapon type
	if (attack_selected == attack_type.basic) {
		instance_create_layer(x, y, "lay_bullets", obj_basicMagic, {speed: 3, direction: theta});
	}
	if (attack_selected == attack_type.fireBall) {
		instance_create_layer(x, y, "lay_bullets", obj_fireBallMagic, {speed: 3, direction: theta});
	}
	if (attack_selected == attack_type.lightning) {
		instance_create_layer(x, y, "lay_bullets", obj_lightningbolt, {image_angle: theta, speed: 3, direction: theta, original: true});
	}
}


var bullet_collide = instance_place(x,y,obj_bulletparent);
if (bullet_collide != noone) {
	instance_destroy(bullet_collide);
	hitpoints -= 1;
}

if (hitpoints == 0) {
	game_restart();	
}