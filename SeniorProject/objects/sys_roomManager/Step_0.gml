/// @description Insert description here
// You can write your code in this editor
if (start_room == true) {	//Currently hard coded to only work with one room. Add all rooms to giant array maybe? Or sort by location?
	enemyList = []
	var enemy = instance_create_layer(1204, 1943, "lay_player",  obj_wizard_spreadshot);
	array_push(enemyList, enemy);
	enemy = instance_create_layer(1404, 2056, "lay_player",  obj_wizard_ring);
	array_push(enemyList, enemy);
	enemy = instance_create_layer(1392, 1828, "lay_player",  obj_wizard_earthRiser);
	array_push(enemyList, enemy);
	start_room = false;
	room_inProgress = true;
}

if (room_inProgress == true) {
	var stillAlive = false;
	for (var i = 0; i < array_length(enemyList); i++) {	//If any enemies in the list are still alive
			if (instance_exists(enemyList[i])) {
				stillAlive = true;	//Do not end room yet
			}
	}
	if (stillAlive == false) {	//End room
		room_inProgress = false;
		instance_destroy(obj_roomWall);
	}
}