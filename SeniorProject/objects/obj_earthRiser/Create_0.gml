event_inherited();

if !(variable_instance_exists(self, "volumeMod")) {
	volumeMod = 0.5;
}

image_speed = 1;
depth = -y;
damage = 5;

timer = 30;

audio_play_sound(aud_earthrose, 1, false, (global.volume/100)*volumeMod);