/// @description Insert description here
// You can write your code in this editor
var instance = instance_place(x, y, obj_enemyParent);
if (instance != noone) {
	instance_create_layer(x, y, "lay_explosion", obj_explosion);
	instance_destroy();
}

// Collision with SolidWall
if place_meeting(x, y, objSolidWall){
	audio_play_sound(aud_attackwallhit, 1, false, global.volume/100);
	instance_create_layer(x, y, "lay_explosion", obj_explosion);
	instance_destroy();
}