/// @description Insert description here
// You can write your code in this editor
var instance = instance_place(x, y, obj_enemyParent);
if (instance != noone) {
	instance.hitpoints -= damage;
	audio_play_sound(aud_playerbasichit, 1, false, global.volume/100);
	instance.image_blend = c_red; // change player to red after getting hit
	instance.alarm[0] = 7; // start timer to reset enemy color (in 7 frames) 
	instance_destroy();
}

// Collision with SolidWall
if place_meeting(x, y, objSolidWall){
	audio_play_sound(aud_attackwallhit, 1, false, global.volume/100);
	instance_destroy();
}