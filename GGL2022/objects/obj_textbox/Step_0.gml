/// @description Insert description here
// You can write your code in this editor

if(text==""||string_length(text)<=index){
	timer--;
	audio_stop_sound(sound);
	
}
else{
	if(!audio_is_playing(sound)){
		audio_play_sound(sound,5,true);
	}
	texttimer--;
	timer = 120;
	if(texttimer<=0){
		texttimer=textspeed;
		index++;
		display+=string_char_at(text,index);
	}
}