/// @description Insert description here
// You can write your code in this editor
if (start_room != -1) {
	enemyList = []
	for (var i = 0; i < array_length(enemiesByRoom[start_room]); i+= 3) {
		var enemy = instance_create_layer(enemiesByRoom[start_room][i], enemiesByRoom[start_room][i+1], "lay_player", enemiesByRoom[start_room][i+2]);
		array_push(enemyList, enemy);
	}
	start_room = -1;
	room_inProgress = true;
	audio_play_sound(aud_roomopen, 1, false, global.volume/100);
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
		audio_play_sound(aud_roomclose, 1, false, global.volume/100);
	}
}