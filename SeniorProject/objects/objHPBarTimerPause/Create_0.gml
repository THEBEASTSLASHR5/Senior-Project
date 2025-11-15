player_hp = 0;
player_max_hp = 1;
global.game_timer_frames = 0;
global.paused = false;
global.just_unpaused = false;

// hp restore is fixed
global.hp_restore_cost = 5;
// this will trackk the level of each upgrade
global.upgrade_levels = {
    hp_max: 0,
    basic_dmg: 0,
    fire_dmg: 0,
    lightning_dmg: 0
}