var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

for(var i=0;i<array_length(sprite);i++) {
	draw_sprite_tiled(sprite[i], 0, _cam_x*offset_x[i], _cam_y*offset_y[i]);
}