if(mouse_check_button_pressed(mb_left)) {
	var _x = mouse_x - (x - sprite_width/2);
	var _y = mouse_y - (y - sprite_height/2);
	if(_x >= 0 && x <= sprite_width && y >= 0 && y <= sprite_height) {
		show_debug_message(string(_x) + ", " + string(_y));	
	}
}