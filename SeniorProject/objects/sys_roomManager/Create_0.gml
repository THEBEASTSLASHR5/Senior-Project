/// @description Insert description here
// You can write your code in this editor
start_room = -1;
room_inProgress = false;
enemyList = [];

//Format is: enemy.x, enemy.y, enemy.obj, enemy2.x, etc... index corresponds to room (WL) number.
enemiesByRoom = [
[1264, 1520, obj_wizard, 1408, 1488, obj_wizard, 1344, 1600, obj_wizard],
[1712, 1536, obj_bomberenemy, 1776, 1488, obj_bomberenemy, 1744, 1504, obj_wizard_ring, 1872, 1568, obj_wizard_spreadshot, 1872, 1440, obj_wizard_spreadshot],
[1408, 1824, obj_wizard_spreadshot, 1200, 1936, obj_wizard_earthRiser, 1408, 2048, obj_wizard_ring],
[1136, 2320, obj_wizard, 1136, 2416, obj_wizard, 1440, 2320, obj_wizard, 1440, 2416, obj_wizard, 864, 2368, obj_wizard_ring, 1728, 2368, obj_wizard_earthRiserMulti],
[2096, 2464, obj_wizard_ring, 2128, 2416, obj_wizard_ring, 2160, 2368, obj_wizard_ring, 2128, 2304, obj_wizard_ring, 2096, 2256, obj_wizard_ring],
[2064, 2048, obj_wizard_earthRiserMulti, 2160, 2112, obj_bomberenemy, 1952, 2112, obj_bomberenemy, 1952, 2000, obj_bomberenemy, 2160, 2000, obj_bomberenemy],
[2512, 2144, obj_wizard, 2512, 1952, obj_wizard, 2608, 2048, obj_wizard_spreadshot, 2864, 2208, obj_wizard, 2864, 1892, obj_wizard, 2880, 2096, obj_wizard_spreadshot, 2832, 2096, obj_wizard_spreadshot, 2832, 2000, obj_wizard_spreadshot, 2880, 2000, obj_wizard_spreadshot, 3040, 2128, obj_bomberenemy, 3040, 1952, obj_bomberenemy],
[544, 2288, obj_wizard, 416, 2352, obj_wizard_ring, 528, 2496, obj_bomberenemy, 560, 2512, obj_wizard_earthRiser],
[560, 2976, obj_bomberenemy, 544, 2976, obj_bomberenemy, 640, 2928, obj_wizard_spreadshot, 464, 2928, obj_wizard_spreadshot, 464, 2656, obj_wizard_spreadshot, 640, 2656, obj_wizard_spreadshot],
[704, 3344, obj_wizard_earthRiserMulti, 704, 3152, obj_earthRiser, 592, 3168, obj_wizard_ring, 592, 3312, obj_wizard_ring, 448, 3312, obj_wizard_ring, 448, 3200, obj_wizard],
[1408, 3232, obj_wizardboss]
]