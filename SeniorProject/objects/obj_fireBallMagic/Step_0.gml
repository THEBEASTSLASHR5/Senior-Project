/// @description Insert description here
// You can write your code in this editor
var instance = instance_place(x, y, obj_enemyParent);
if (instance != noone) {
	instance_create_layer(x, y, "lay_explosion", obj_explosion);
	instance_destroy();
}