if(global.c_devil.x<=center+200){
	global.c_devil.sprite_index = spr_devil_cutscene_idle;
	scr_text("DYou, you're an angel!");
	scr_text("DYou shouldn't be down here.");
}
else{
	global.c_devil.x-=5;
	timeline_position--;
}