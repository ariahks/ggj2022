with(instance_place(x, y, obj_thing)) {
	if(!alive)
	{
		exit;
	}
	view_object[0] = 99999;
	instance_create_depth(x, y, -999, obj_explosion);
	alive = false;
}