draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, 0xffffff, 1);

draw_set_font(fnt_main);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

for(var i=0;i<array_length(page[index].options);i++) {
	var _c1 = page[index].options[i].colors.col1;
	var _c2 = page[index].options[i].colors.col2;
	if(page[index].pos == i) {
		_c1 = page[index].options[i].colors.sel1;
		_c2 = page[index].options[i].colors.sel2;	
	}
	
	draw_text_color(x+width/2, y+op_border+op_space*i, page[index].options[i].str, _c1, _c1, _c2, _c2, 1);
}