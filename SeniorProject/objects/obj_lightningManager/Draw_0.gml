/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_testenemy)) {
	draw_sprite_ext(spr_lightning, 0, x, y, 1, distance_to_object(obj_testenemy)/16 + obj_testenemy.sprite_width/32, point_direction(x, y, mouse_x, mouse_y)-90, c_white, 1); 
	
}