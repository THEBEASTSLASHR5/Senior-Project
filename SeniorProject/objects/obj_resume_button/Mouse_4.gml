// Resume game
global.paused = false;
game_set_speed(60, gamespeed_fps);

// Hide resume button, show pause button
instance_create_layer(x, y, layer, obj_pause_button);
audio_play_sound(aud_menublip, 1, false, global.volume/100);
instance_destroy();