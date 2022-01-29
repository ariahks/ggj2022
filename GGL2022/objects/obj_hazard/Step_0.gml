with(instance_place(x, y, obj_thing)) {
	instance_create_depth(x, y, -999, obj_explosion);
	instance_destroy();
}