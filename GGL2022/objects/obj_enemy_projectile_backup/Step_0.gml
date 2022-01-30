event_inherited();

if(timer > 300) {
	y = source.y;
} else if(timer == 300) {
	var _dir = [obj_thing.x - x, obj_thing.y - y];
	velocity = scale(_dir, 4/norm(_dir));
} else {
	x += velocity[0];
	y += velocity[1];
}

if(timer > 0) {
	timer--;	
} else {
	image_alpha -= 1/60;

	if(image_alpha <= 0) instance_destroy();
}
