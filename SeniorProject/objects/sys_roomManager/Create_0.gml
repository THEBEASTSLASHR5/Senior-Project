/// @description Insert description here
// You can write your code in this editor
start_room = -1;
room_inProgress = false;
enemyList = [];

//Format is: enemy.x, enemy.y, enemy.obj, enemy2.x, etc... index corresponds to room (WL) number.
enemiesByRoom = [
[1204, 1943, obj_wizard_spreadshot, 1404, 2056, obj_wizard_ring, 1392, 1828, obj_wizard_earthRiser],
[1744, 1504, obj_wizard_ring, 1744, 1584, obj_bomberenemy, 1744, 1440, obj_bomberenemy, 1888, 1440, obj_wizard_spreadshot, 1888, 1568, obj_wizard_spreadshot]
]