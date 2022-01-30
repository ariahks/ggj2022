/// @description Insert description here
// You can write your code in this editor

if(play == 2){
	play = 0;
	for(i = 0; i<7;i++){
		audio_sound_gain(music[i],0,fade_out);
	}
	alarm[0] = 60*fade_out/1000;
}


if(play==1){
	value = (32-((audio_sound_get_track_position(index[current])*bpm/60.0)%32.0))*(60.0/bpm)*60.0;
	alarm[1] = value;
	play = 0;
}