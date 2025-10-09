// Resume game
global.paused = false;
game_set_speed(60, gamespeed_fps);

// Hide resume button, show pause button
instance_create_layer(x, y, layer, obj_pause_button);
instance_destroy();