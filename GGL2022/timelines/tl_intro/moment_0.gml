obj_thing.image_alpha = 0;
global.pause = true;
ground = 1164;
center = 700;
scr_play(6, false);
global.lock = instance_create_depth(center,ground,0,obj_cutscene_lock);




global.c_angel = instance_create_depth(center,ground,0,obj_c_angel);
global.c_angel.image_index = 2;