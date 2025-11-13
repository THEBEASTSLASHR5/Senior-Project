event_inherited();
hitpoints = 100;
max_hitpoints = 100;

my_color = c_orange
image_blend = c_orange

maxtimer = 120;
timer = maxtimer;
charge = 0;
maxcharge = 30;

spreadshootcount = 0;

pausebetween = 10

targetx = 0;
targety = 0;

earthriseroffset = 0;
earthrisermoveoffset = 0;
earthriserloops = 32;
earthriserdelay = 10;

enum attacks {
	Spread,
	MegaEarthriser,
	Summon,
	SummonBombs,
}

attackList = [attacks.Spread, attacks.Spread, attacks.MegaEarthriser, attacks.Spread, attacks.SummonBombs, attacks.Summon, attacks.Spread, attacks.MegaEarthriser];
attacknum = 0;
current_attack = attackList[attacknum]