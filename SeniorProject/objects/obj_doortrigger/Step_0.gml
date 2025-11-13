visible = true;

if place_meeting(x, y, obj_player) {
	for (var i = 0; i < array_length(walls[WL]); i+= 3) {
		var wall = instance_create_layer(walls[WL][i], walls[WL][i+1], "Instances", obj_roomWall)
		wall.image_xscale = 3;
		wall.image_angle = walls[WL][i+2]
	}
	sys_roomManager.start_room = WL;	
	instance_destroy();
}