if(!alive)
{
	exit;
}

//draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, radtodeg(angle)/*+100*/, c_white, 1);
draw_sprite_ext(sprite_devil, sprite_devil_index, x, y, 1, 1, radtodeg(angle) + devil_rotation, c_white, 1);
draw_sprite_ext(sprite_angel, sprite_angel_index, x, y, 1, 1, radtodeg(angle) + angel_rotation, c_white, 1);
draw_sprite_ext(spr_devil_wings, wing_devil_index, x, y, 1, 1, radtodeg(angle) + devil_rotation, c_white, 1);
draw_sprite_ext(spr_angel_wings, wing_angel_index, x, y, 1, 1, radtodeg(angle) + angel_rotation, c_white, 1);


draw_set_color(c_yellow);
var _p = [64, 0];
_p = rotate(_p, angle);
_p = add(_p, [x, y]);
draw_point(_p[0], _p[1]);

/*var _mouse = [mouse_x-x, mouse_y-y];
if(mouse_check_button(mb_left)) {
	draw_set_color(c_red);
	draw_line(mouse_x, mouse_y, x + rotate([64, 0], angle)[0], y + rotate([64, 0], angle)[1]);
	applyForce(scale(_mouse, 1/norm(_mouse)), [1, 0]);
}*/