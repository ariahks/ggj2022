/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_gazer, 0, x, y);
draw_sprite(spr_gazer_pupil, 0, x+8*round(dcos(direction)), y-8*round(dsin(direction)));
draw_sprite_ext(spr_gazer_shine, 0, x, y, 1, 1, 0, c_white, 0.8);

//draw_sprite_ext(spr_gazer_pupil, 0, 3*cos(direction), 3*sin(direction))