/// @description Insert description here
// You can write your code in this editor


var instance = instance_place(x, y, obj_enemyParent);
if ((instance != noone)) {
	if !(instance_exists(donthit)) {
		donthit = noone;
	}
	
	if (instance != donthit) {
		if (variable_instance_exists(self, "original")) {
			originalBonusDamage = 2;
			instance_create_layer(x, y, "lay_explosion", obj_lightningRadius, {origin: instance, originx: instance.x, originy: instance.y});
		}
		instance.hitpoints -= 3 + originalBonusDamage;
		audio_play_sound(aud_playerlightningstrike, 1, false, global.volume/200);
		instance_destroy();
	}
}

// Collision with SolidWall
if place_meeting(x, y, objSolidWall){
	audio_play_sound(aud_attackwallhit, 1, false, global.volume/100);
	instance_destroy();
}