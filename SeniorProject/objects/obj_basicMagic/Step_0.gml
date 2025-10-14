/// @description Insert description here
// You can write your code in this editor
var instance = instance_place(x, y, obj_enemyParent);
if (instance != noone) {
	instance.hitpoints -= 1;
	instance_destroy();
}

// Collision with SolidWall
if place_meeting(x, y, objSolidWall){
	instance_destroy();
}