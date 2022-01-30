if(global.c_devil.x<=center+400){
	//alert
	global.c_alert = instance_create_depth(global.c_devil.x-64,global.c_devil.y-48,0,obj_alert);
	global.c_devil.sprite_index = spr_devil_cutscene_idle
}
else{
	
	timeline_position--;
	global.c_devil.x-=3;
}