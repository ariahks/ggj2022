var _w = display_get_gui_width();
var _h = display_get_gui_height();

//ctrl_movement_inputs(true);
//ctrl_control_inputs(true);

key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

key_any = keyboard_check_pressed(vk_anykey);

if(key_up) func_up();
if(key_down) func_down();
if(key_right) page[index].options[page[index].pos].func_right();
if(key_left) page[index].options[page[index].pos].func_left();

if(!key_up && !key_down && !key_right && !key_left && key_any) {
	//var _blip = page[index].options[page[index].pos].blip_act;
	//if(_blip != -1) audio.sfx_play(_blip);
	page[index].options[page[index].pos].func();
}

var _length = array_length(page[index].options);

var _width = 0;
var _height = 0;
draw_set_font(fnt_main);
for(var i=0;i<_length;i++) {
	var _op_w = string_width(page[index].options[i].str);
	_width = max(_width, _op_w);
	_height = max(_height, string_height(page[index].options[0].str));
}
width = max(0, _width + 2*op_border);
height = op_border*2 + _height + (_length-1)*op_space;

x = _w/2 - width/2 + x_offset;
y = _h/2 - height/2 + y_offset;