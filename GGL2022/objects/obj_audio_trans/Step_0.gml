/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_thing)){
	if(position_meeting(instance_find(obj_thing,0).x,instance_find(obj_thing,0).y,self)){
		scr_play(index,smooth);
		instance_destroy();
	}
}