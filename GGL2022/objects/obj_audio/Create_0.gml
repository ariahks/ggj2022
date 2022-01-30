/// @description Insert description here
// You can write your code in this editor

global.audio = self;
music[0] = aud_intro;
music[1] = aud_hell1;
music[2] = aud_hell2;
music[3] = aud_hell3;
music[4] = aud_heaven1;
music[5] = aud_heaven2;
music[6] = aud_silence;

bpm = 112;
fade_out = 1000;
play = 0;
ram = 6;

current = 6;

for(i = 0; i<7;i++){
	index[i] = audio_play_sound(music[i],10,true);
	audio_sound_gain(music[i],0,0);
}