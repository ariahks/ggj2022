
y -= scroll_speed;

if(keyboard_check_pressed(vk_escape)) {
	image_alpha -= 0.05;
}
if(image_alpha > 0 && image_alpha < 1) image_alpha -= 0.05;

if((y+sprite_height < 0 || image_alpha <= 0) && scroll_speed > 0) {
	scroll_speed = 0;
	audio_sound_gain(inst, 0, 1000);
}

if(audio_sound_get_gain(inst) <= 0.01) {
	audio_stop_all();
	instance_destroy(obj_audio);
	room_goto(rm_menu);	
}