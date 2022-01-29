function Polygon(_vertices) constructor {
	vertices = _vertices;
	
	getIntersectionsWithLine = function(_line) {
		var _intersections = [];
		for(var i=0;i<array_length(vertices);i++) {
			var _edge = new Line(vertices[i][0], vertices[i][1], vertices[(i+1) % array_length(vertices)][0], vertices[(i+1) % array_length(vertices)][1]);
			var _intersection = _edge.intersects(_line);
			for(var j=0;j<array_length(_intersection);j++) {
				array_push(_intersections, _intersection[j]);
			}
		}
		return _intersections;
	}
	
	getIntersectionsWithPolygon = function(_polygon) {
		var _intersections = [];
		
		var _first_intersection_entering = false;
		var _first_intersection_found = false;
		
		for(var i=0;i<array_length(vertices);i++) {
			var _edge = new Line(vertices[i][0], vertices[i][1], vertices[(i+1) % array_length(vertices)][0], vertices[(i+1) % array_length(vertices)][1]);
			var _intersectionsWithEdge = _polygon.getIntersectionsWithLine(_edge);
			if(!_first_intersection_found && array_length(_intersectionsWithEdge) > 0) {
				_first_intersection_found = true;
				if(_polygon.encloses(vertices[i])) {
					_first_intersection_entering = false;	
				} else {
					_first_intersection_entering = true;	
				}
			}
			for(var j=0;j<array_length(_intersectionsWithEdge);j++) {
				array_push(_intersections, _intersectionsWithEdge[j]);
			}
		}
		if(_first_intersection_found && !_first_intersection_entering) {
			var _first_intersection = _intersections[0];
			array_delete(_intersections, 0, 1);
			array_push(_intersections, _first_intersection);
		}
		if(array_length(_intersections) % 2 != 0) array_delete(_intersections, array_length(_intersections)-1, 1); //Bad but prevents crashes
		return _intersections;
	}
	
	encloses = function(_point) {
		if(array_length(getIntersectionsWithLine(new Line(-0xffffff, -0xffffff, _point[0], _point[1]))) % 2 == 0) return false;
		return true;
	}
	
	transform = function(_translation, _rotation) {
		var _transformed_vertices = [];
		for(var i=0;i<array_length(vertices);i++) {
			array_push(_transformed_vertices, add(rotate(vertices[i], _rotation), _translation));	
		}
		return new Polygon(_transformed_vertices);
	}
}

function Line(_x1, _y1, _x2, _y2) constructor {
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	intersects = function(_line) {
		var x3 = _line.x1;
		var y3 = _line.y1;
		var x4 = _line.x2;
		var y4 = _line.y2;
		
		var _det_denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
		
		if(abs(_det_denom) < 0.01) {
			return [];
		}
		
		var _det1 = (x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4);
		var _det2 = (x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3);
		
		var _param1 = _det1 / _det_denom;
		var _param2 = -_det2 / _det_denom;
		
		if(!(0 <= _param1 && _param1 <= 1) || !(0 <= _param2 && _param2 <= 1)) {
			return [];	
		}
		
		var _intersection = [x1 + _param1 * (x2 - x1), y1 + _param1 * (y2 - y1)];
		return [_intersection];
	}
}

/*function Solid(_mass, _inertia, _vertices) constructor {
	mass = _mass;
	inertia = _inertia;
	polygon = new Polygon(_vertices);
	position = [0, 0];
	transformed_polygon = polygon.transform([0, 0], 0);
	velocity = VEC_ZERO;
	velocity_angular = 0;
	
	getKineticEnergy = function() {
		var _v = norm(velocity);
		var _linear = _v == 0 ? 0 : 0.5 * mass * _v^2;
		var _rotational = velocity_angular == 0 ? 0 : 0.5 * inertia * velocity_angular^2;
		return _linear + _rotational;
	}
	
	applyForce = function(_force, _pos) {
		if(inertia != infinity) {
			var _r = add(position, scale(_pos, -1));
			var _torque = cross(_r, _force);
			velocity_angular += _torque / inertia;
		}
		if(mass != infinity) {
			velocity = add(velocity, scale(_force, 1 / mass));	
		}
	}
	
	updateSolid = function(_x, _y, _rotation) {
		position = [_x, _y];
		transformed_polygon = polygon.transform([_x, _y], _rotation);
	}
}*/

function Collision(_intersection1, _intersection2, _collider1, _collider2) constructor {
	location = scale(add(_intersection1, _intersection2), 1 / 2);
	collider1 = _collider1;
	collider2 = _collider2;
	parallel_to_surface = add(_intersection1, scale(_intersection2, -1));
	perpendicular_to_surface1 = [parallel_to_surface[1], -parallel_to_surface[0]];
	perpendicular_to_surface2 = scale(perpendicular_to_surface1, -1);
	
	if(distance(add(location, perpendicular_to_surface1), [collider1.x, collider1.y]) <= distance(add(location, perpendicular_to_surface2), [collider1.x, collider1.y])) {
		unit_normal = scale(perpendicular_to_surface1, 1/norm(perpendicular_to_surface1));
	} else {
		unit_normal = scale(perpendicular_to_surface2, 1/norm(perpendicular_to_surface2));
	}
	
	calculate_force = function() {
		var _r1_perp = cross(add([collider1.x, collider1.y], scale(location, -1)), unit_normal);
		var _r2_perp = cross(add([collider2.x, collider2.y], scale(location, -1)), unit_normal);
		var _m1 = collider1.mass;
		var _m2 = collider2.mass;
		var _i1 = collider1.inertia;
		var _i2 = collider2.inertia;
		var _omega1 = collider1.velocity_angular;
		var _omega2 = collider2.velocity_angular;
		
		var _a = 1/_m1 + 1/_m2 + sqr(_r1_perp) / _i1 + sqr(_r2_perp) / _i2;
		var _b = dot(collider1.velocity, unit_normal) - dot(collider2.velocity, unit_normal) + _omega1 * _r1_perp - _omega2 * _r2_perp;
		var _previous_energy_doubled = 2 * (collider1.getKineticEnergy() + collider2.getKineticEnergy());
		
		var _root = sqr(_b) - _a * _previous_energy_doubled * (1 - ENERGY_CONSERVED);
		var _collision_force = (-_b + (_root < 0 ? 0 : sqrt(_root))) / _a;
		
		//show_debug_message(_collision_force);
		force = scale(unit_normal, _collision_force);
	}
	
	apply = function() {
		collider1.applyForce(force, location);
		collider2.applyForce(scale(force, -1), location);
	}
}