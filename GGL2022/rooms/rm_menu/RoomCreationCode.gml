
global.vol_music = 100;
global.vol_sounds = 100;
global.fullscreen = false;
global.scales = [0.6, 0.8, 1, 1.2];
global.scale_index = 2;
global.pause = false;

window_set_size(1600*global.scales[global.scale_index], 900*global.scales[global.scale_index]);
window_set_position((display_get_width() - 1600*global.scales[global.scale_index])/2, (display_get_height() - 900*global.scales[global.scale_index])/2);

scr_play(0, false);