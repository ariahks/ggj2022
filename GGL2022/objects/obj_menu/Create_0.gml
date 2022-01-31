depth = -9999;

//sprite_index = gfx_ui_box_black;
image_index = 0;
image_speed = 1;

//font = gfx_font_menu;

op_border = 32;
op_space = 64;

x_offset = 0;
y_offset = 0;

//blip_move = snd_blip_move;

width = 0;
height = 0;

//darken_background = false;

///@param options
function Page(_options) constructor {
	pos = 0;
	options = _options;
}

///@param string
///@param function_z
///@param function_left
///@param function_right
///@param blip
///@param color1
///@param color2
///@param color_selected1
///@param color_selected2
function Option(_str, _func = function() { }, _func_left = function() { }, _func_right = function() { }, _col1 = 0xffffff, _col2 = 0xaaaaaa, _sel1 = 0xffff00, _sel2 = 0xaaaa00) constructor {
	str = _str;
	colors = {
		col1 : _col1,
		col2 : _col2 == -1 ? _col1 : _col2,
		sel1 : _sel1,
		sel2 : _sel2
	};

	//blip_act = _blip;

	func = _func;

	func_right = _func_right;
	func_left = _func_left
}


func_up = function() {
	//if(blip_move != -1 && array_length(page[index].options) > 1) audio.sfx_play(blip_move);
	page[index].pos--;
	if(page[index].pos < 0) page[index].pos = array_length(page[index].options)-1;
}
func_down = function() {
	//if(blip_move != -1 && array_length(page[index].options) > 1) audio.sfx_play(blip_move);
	page[index].pos++;
	if(page[index].pos >= array_length(page[index].options)) page[index].pos = 0;
}

page[0] = new Page([]);
index = 0;