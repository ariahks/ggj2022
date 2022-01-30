with(instance_place(x, y, obj_thing)) {
	if(!alive || !other.kill_enabled)
	{
		exit;
	}
	//view_object[0] = 99999;
	with(instance_create_depth(x, y, -999, obj_explosion)) {
		image_angle = radtodeg(obj_thing.angle);	
	}
	alive = false;
	if(other.destroy_on_collide) instance_destroy(other);
}