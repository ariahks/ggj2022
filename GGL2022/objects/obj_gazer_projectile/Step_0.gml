event_inherited();

if(growing) {
	y = source.y
	image_angle = source.direction - 90;
} else if(timer == 300) {
	var _dir = [obj_thing.x - x, obj_thing.y - y];
	velocity = scale(_dir, 6/norm(_dir));
} else {
	x += velocity[0];
	y += velocity[1];
}

if(timer > 0 && !growing) {
	timer--;	
} else if(timer == 0) {
	kill_enabled = false;
	image_alpha -= 1/60;

	if(image_alpha <= 0) instance_destroy();
}
