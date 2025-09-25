/// @description Insert description here
// You can write your code in this editor
draw_self();
if (attack_selected = attack_type.basic) {	//Show weapon type icon
	draw_sprite_ext(spr_basicMagic, 0, x-10, y-10, 0.5, 0.5,0,c_white,1);
} else if (attack_selected = attack_type.fireBall) {
	draw_sprite_ext(spr_fireBallMagic, 0, x-10, y-10, 0.5, 0.5,0,c_white,1);
} else if (attack_selected = attack_type.lightning) {
	draw_sprite_ext(spr_lightningbolt, 0, x-10, y-10, 0.5, 0.5,0,c_white,1);
}


