/// @description Insert description here
// You can write your code in this editor
if (global.volume <= 0) {
	global.volume = 100;	
} else {
	global.volume -= 25;	
}
audio_play_sound(aud_menublip, 1, false, global.volume/100);