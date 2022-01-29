angle = degtorad(image_angle);
mass = infinity;
inertia = infinity;
polygon = undefined;
transformed_polygon = undefined;
velocity = VEC_ZERO;
velocity_angular = 0;
	
function getKineticEnergy() {
	var _v = norm(velocity);
	var _linear = _v == 0 ? 0 : 0.5 * mass * sqr(_v);
	var _rotational = velocity_angular == 0 ? 0 : 0.5 * inertia * sqr(velocity_angular);
	return _linear + _rotational;
}
	
function applyForce(_force, _pos) {
	if(inertia != infinity) {
		var _r = scale(add(_pos, scale([x,y], -1)), -1); //-1 to deal with GMS2's weird coordinate system (y = -y)
		var _torque = cross(_r, _force);
//		obj_controller.queue_line_draw(_pos, add(_pos, scale(_force, 1000))); // Draw Force Lines
		velocity_angular += _torque / inertia;
	}
	if(mass != infinity) {
		velocity = add(velocity, scale(_force, 1 / mass));	
	}
}

function applyForceRel(_force, _pos) {
	applyForce(_force, add([x,y], rotate(_pos, angle)));
}
	
function updateTransformedPolygon() {
	transformed_polygon = polygon.transform([x, y], angle);
}