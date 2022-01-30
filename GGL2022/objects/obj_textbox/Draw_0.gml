/// @description Insert description here
// You can write your code in this editor
var c = draw_get_color();
//draw_set_font(font_main);
draw_set_color(c_black);
draw_set_alpha(image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, is_devil ? $ccccff : $ffffff, image_alpha);
draw_set_halign(fa_left);
draw_text_transformed(x+40, y+40, display,1,1,0);
draw_set_alpha(1);
draw_set_color(c);
