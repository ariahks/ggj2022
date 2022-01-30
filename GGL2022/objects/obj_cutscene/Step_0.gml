/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_thing)){
	if(position_meeting(instance_find(obj_thing,0).x,instance_find(obj_thing,0).y,self)){
		global.cutscene.timeline_index = tl_intro;
		global.cutscene.timeline_position = 0;
		global.cutscene.timeline_running = true;
		instance_destroy();
	}
}