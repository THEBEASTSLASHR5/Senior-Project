/// @description Insert description here
// You can write your code in this editor

var _list = ds_list_create(); //https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_place_list.htm
var _num = instance_place_list(x, y, obj_enemyParent, _list, false);

if _num > 0	//Iterate through all nearby enemies.
{
	for (var i = 0; i < _num; ++i;)
	{
		if !(instance_exists(origin)) {	//If the origin has already been destroyed, set to noone to avoid error.
			origin = noone;	
		}
		
		if (_list[| i] == origin) {	//Don't fire a lightning bolt at yourself.
			continue;
		}
		
		var theta = (point_direction(originx, originy, _list[| i].x, _list[| i].y));
		//show_debug_message(i);
		//show_debug_message(originx);
		//show_debug_message(originy);
		//show_debug_message(_list[| i].x);
		//show_debug_message(_list[| i].y);
		//show_debug_message(theta);
		instance_create_layer(originx, originy, "lay_bullets", obj_lightningbolt, {image_angle: theta, speed: 5, direction: theta, 
			donthit: origin, image_xscale: 0.5, image_yscale: 0.5, damage: obj_player.lightning_stats.chain_damage});	//Shoot a smaller lightning bolt at every nearby enemy.
	}
}

ds_list_destroy(_list);

instance_destroy();