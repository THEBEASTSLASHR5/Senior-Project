//Player Input
var move_right = keyboard_check(ord("D"));
var move_down = keyboard_check(ord("S"));
var move_left = keyboard_check(ord("A"));
var move_up = keyboard_check(ord("W"));
var roll = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_shift);
var attack = keyboard_check_pressed(ord("J"));

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

if (attack == true) {
	var hitbox = instance_create_layer(x, y, "lay_player", obj_swordhitbox);	
	hitbox.image_angle = radtodeg(dir_angle)-90;
}

var bullet_collide = instance_place(x,y,obj_bulletparent);
if (bullet_collide != noone) {
	instance_destroy(bullet_collide);
	hitpoints -= 1;
}

if (hitpoints == 0) {
	game_restart();	
}