visible = true;
if place_meeting(x, y, obj_player) {
	var wall1 = instance_create_layer(1280, 1680, "Instances", obj_roomWall);
	wall1.image_xscale = 3;
	var wall2 = instance_create_layer(1280, 2128, "Instances", obj_roomWall);
	wall2.image_xscale = 3;
	sys_roomManager.start_room = true;
	instance_destroy();
}