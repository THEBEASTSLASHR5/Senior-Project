if (hitpoints <= 0) {
	instance_create_layer(x, y, "Instances", obj_gem_boss);
	instance_destroy();
	room = rm_win;
}

event_inherited()

if (global.paused) {
    // Stop animations and skip movement logic
    image_speed = 0;
    exit;
}
image_speed = 1; // restore animation when unpaused

event_inherited();
if (state == enemy_state.CombatIdle) {
	sprite_index = spr_wizardboss;
	if (timer == 0) {
		timer = maxtimer;
		state = enemy_state.Attacking;
	} else if (timer > 0) {
		timer -= 1;	
	}

} else if (state == enemy_state.Attacking) {
	path_end();
	sprite_index = spr_wizardboss_attack;
	if (charge < maxcharge) {
		charge++;
	} else {
		if (current_attack == attacks.Spread) {
			if (pausebetween >= 10) {
				targetx = obj_player.x
				targety = obj_player.y
				audio_play_sound(aud_enemybasicshoot, 1, false, global.volume/100);
				for (var i = 0; i < 8; i++) {
					var bullet = instance_create_layer(x,y,"lay_bullets",obj_wizardmagic);
					bullet.direction = point_direction(x,y,targetx,targety)+120-(i*30);
					bullet.speed = 2
					bullet.image_blend = c_orange;
				}
				pausebetween -= 1
			} else if (pausebetween <= 0) {
				for (var i = 0; i < 8; i++) {
					var bullet = instance_create_layer(x,y,"lay_bullets",obj_wizardmagic);
					bullet.direction = point_direction(x,y,targetx,targety)+135-(i*30);
					bullet.speed = 2
					bullet.image_blend = c_yellow;
				}
			charge = 0;
			mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
			path_start(path, 0.5, path_action_stop, 0);
			state = enemy_state.CombatIdle;
			pausebetween = 10
			attacknum += 1;
			current_attack = attackList[attacknum%8]
			} else {
				pausebetween -= 1;	
			}
		} else if (current_attack = attacks.MegaEarthriser) {
			
				if (earthriserloops >= 0) {
					if (earthriserdelay > 0) {
						earthriserdelay -= 1;	
					} else {
						for (var i = 0; i < 8; i++) {
							var bullet = instance_create_layer(x+(50+120*sin(earthrisermoveoffset))*cos(degtorad(i*45+earthriseroffset)),y+(50+120*sin(earthrisermoveoffset))*sin(degtorad(i*45+earthriseroffset)),"lay_bullets",obj_earthRiser_Warning, {volumeMod: 0.0});
						}
						audio_play_sound(aud_earthrise, 1, false, global.volume/100);
						earthriseroffset += 15;
						earthrisermoveoffset += pi/32
						earthriserloops -= 1;
						earthriserdelay = 10
					}
				} else {
					charge = 0;
					earthriseroffset = 0;
					earthrisermoveoffset = 0;
					earthriserloops = 32;
					earthriserdelay = 30;
					mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
					path_start(path, 0.5, path_action_stop, 0);
					state = enemy_state.CombatIdle;
					attacknum += 1;
					current_attack = attackList[attacknum%8]
				}
		} else if (current_attack = attacks.Summon) {
			instance_create_layer(x - 64, y, "lay_player", obj_wizard_ring)
			instance_create_layer(x + 64, y, "lay_player", obj_wizard_ring)
			charge = 0;
			mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
			path_start(path, 0.5, path_action_stop, 0);
			state = enemy_state.CombatIdle;
			attacknum += 1;
			current_attack = attackList[attacknum%8]
		} else if (current_attack = attacks.SummonBombs) {
			instance_create_layer(x - 64, y, "lay_player", obj_bomberenemy)
			instance_create_layer(x + 64, y, "lay_player", obj_bomberenemy)
			charge = 0;
			mp_potential_path_object(path, obj_player.x, obj_player.y, 3, 4, objWall);
			path_start(path, 0.5, path_action_stop, 0);
			state = enemy_state.CombatIdle;
			attacknum += 1;
			current_attack = attackList[attacknum%8]
		}
		
	}
		

}