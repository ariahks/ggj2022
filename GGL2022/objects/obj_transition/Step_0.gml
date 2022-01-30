if(room == dest_room && image_index == 0) instance_destroy();

show_debug_message(image_index);

if(image_index >= image_number-1) {
	image_speed = -1;
	if(dest_room > -1) room_goto(dest_room);
	else {
		instance_destroy(obj_gazer_projectile);
		instance_destroy(obj_explosion);
		instance_destroy(obj_projectile);
		dest_room = room;
	}
	if(dest_x > -1) obj_thing.x = dest_x;
	if(dest_y > -1) obj_thing.y = dest_y;
	obj_thing.alive = true;	
}