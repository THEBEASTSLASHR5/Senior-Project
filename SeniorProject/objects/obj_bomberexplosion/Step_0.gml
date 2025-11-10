if (currentImage <= 0) {	//Make sure explosion hitbox matches image.
	image_index = 0;
	mask_index = htbx_fireBall1;
} else if (currentImage == 1) {
	image_index = 1;
	mask_index = htbx_fireBall2;
} else if (currentImage == 2) {
	image_index = 2;
	mask_index = htbx_fireBall3;
}


if ((animate_Timer >= maxanimate_Timer) && (currentImage < 2)) { //Deal damage to all enemies caught in blast
	
	currentImage += 1;
	if (currentImage == 2) {
		if (place_meeting(x, y, obj_player) && obj_player.rolltimer <= 0) {
			obj_player.hitpoints -= 10;
			obj_player.hit_flash_timer = 7;
		}
	}
	
} else {
	animate_Timer += 1;	
}

if (currentImage >= 2) {	//Delay removal
	remove_Timer -= 1;
}

if (remove_Timer == 0) {
	instance_destroy();	
}