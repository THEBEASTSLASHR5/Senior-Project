if (image_index >= 4) {
image_speed = 0;	
}

if (timer > 0) {
	timer -= 1;	
} else {
	image_speed = -2;
	if (image_index <= 0) {
		instance_destroy();	
	}
}