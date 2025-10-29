
if (hitpoints <= 0) {
	instance_create_layer(x, y, "Instances", obj_gem);
	instance_destroy();	
}
depth = -y;

if distance_to_object(obj_player) > 300 {
	timer = maxtimer //Deactive far enemies
}