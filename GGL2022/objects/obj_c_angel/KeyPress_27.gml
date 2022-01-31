global.pause=false;
instance_destroy(obj_cutscene_lock);
instance_destroy(obj_c_angel);
instance_destroy(obj_c_devil);
instance_destroy(obj_cutscene_manager);
instance_create_depth(0, 0, 0, obj_cutscene_manager);
instance_destroy(obj_text);
instance_destroy(obj_textbox);
instance_destroy(obj_text_manager);
instance_create_depth(0, 0, 0, obj_text_manager);

//obj_thing.x = center;
//obj_thing.y = ground-150;
obj_thing.image_angle = 0;
obj_thing.image_alpha = 1;
scr_play(1, false);