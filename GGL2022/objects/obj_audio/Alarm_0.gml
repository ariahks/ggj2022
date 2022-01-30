/// @description Insert description here
// You can write your code in this editor
for(i = 0; i<7;i++){
	audio_stop_sound(music[i]);
	index[i] = audio_play_sound(music[i],10,true);
	audio_sound_gain(music[i],0,0);
}
audio_sound_gain(music[current],global.vol_music/100,fade_out/2);