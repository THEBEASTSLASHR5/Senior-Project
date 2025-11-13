if (timer > 0) {
	timer -= 1;	
} else {
	instance_create_layer(x,y,"lay_player", obj_earthRiser, {volumeMod: volumeMod});
	instance_destroy();
}