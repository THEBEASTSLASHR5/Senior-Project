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
		var _list = ds_list_create(); //https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_place_list.htm
		var _num = instance_place_list(x, y, obj_enemyParent, _list, false);

		if _num > 0
		{
		    for (var i = 0; i < _num; ++i;)
		    {
		        _list[| i].hitpoints -= 3;
		    }
		}

		ds_list_destroy(_list);
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