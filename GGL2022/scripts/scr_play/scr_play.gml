// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


///@arg index
///@arg true: smooth transition, false: hard transition
function scr_play(){
	if(argument[1]){
		global.audio.play = 1;
		global.audio.ram = argument[0];
	}
	else{
		global.audio.play = 2;
		global.audio.current = argument[0];
	}
}