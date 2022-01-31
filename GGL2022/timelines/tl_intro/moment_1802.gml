if(global.c_devil.x<=center){
	global.pause=false;
	instance_destroy(global.lock);
	instance_destroy(global.c_angel);
	instance_destroy(global.c_devil);
	//obj_thing.x = center;
	//obj_thing.y = ground-150;
	obj_thing.image_angle = 0;
	obj_thing.image_alpha = 1;
	scr_play(1, false);
}
else{
	global.c_devil.x-=2;
	timeline_position--;
}