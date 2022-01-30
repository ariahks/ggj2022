/*var _vel_normed;
if(norm(obj_thing.velocity) > 1) {
	_vel_normed = scale(obj_thing.velocity, 1/norm(obj_thing.velocity));
} else {
	_vel_normed = obj_thing.velocity;	
}*/


x = lerp(x, obj_thing.x + 3*obj_thing.velocity[0], 0.2);
y = lerp(y, obj_thing.y + 3*obj_thing.velocity[1], 0.2);