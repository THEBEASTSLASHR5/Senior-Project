visible = true;

if place_meeting(x, y, obj_player) {
	var wall1 = instance_create_layer(walls[WL][0], walls[WL][1], "Instances", obj_roomWall);
	wall1.image_xscale = 3;
	wall1.image_angle = walls[WL][2]
	var wall2 = instance_create_layer(walls[WL][3], walls[WL][4], "Instances", obj_roomWall);
	wall2.image_xscale = 3;
	wall2.image_angle = walls[WL][5]
	sys_roomManager.start_room = WL;
	instance_destroy();
}