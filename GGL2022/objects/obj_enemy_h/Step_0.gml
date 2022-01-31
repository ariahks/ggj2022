/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_menu)) {
	image_speed = 0;
	exit;
} else image_speed = 1;

event_inherited();
y_offset = 2*dsin(4*offset_count);
x_offset = 5.5*dcos(0.7*offset_count);
offset_count += 2;
y += y_offset;
x += x_offset;