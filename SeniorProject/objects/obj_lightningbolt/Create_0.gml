/// @description Insert description here
// You can write your code in this editor
if !(variable_instance_exists(self, "donthit")) {
	donthit = noone;
}

originalBonusDamage = 0;

if !(variable_instance_exists(self, "original")) {
	audio_play_sound(aud_playerlightningattack, 1, false, global.volume/200);
}
