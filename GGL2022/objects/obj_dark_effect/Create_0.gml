/// @description Insert description here
// You can write your code in this editor
x=camera_get_view_x(view_camera[0]);
y=camera_get_view_y(view_camera[0]);

global.dark_effect = self;

a = instance_create_depth(x+800,y+450,-1000,obj_dark_object);
a.sprite_index = spr_dark1;
b = instance_create_depth(x+800,y+450,-1000,obj_dark_object);
b.sprite_index = spr_dark2;


radius1 = 550;
radius2 = 700;