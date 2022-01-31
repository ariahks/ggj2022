var _collidables = [];
for(var i=0;i<instance_number(obj_collidable);i++) {
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _border_x = _cw;
	var _border_y = _ch;
	var _inst = instance_find(obj_collidable, i);
	//if(_inst.x < _cx-_border_x || _inst.x > _cx+_cw+_border_x || _inst.y < _cy-_border_y || _inst.y > _cy+_ch+_border_y) continue;
	_inst.updateTransformedPolygon(_inst.x, _inst.y, _inst.angle);
	array_push(_collidables, _inst);
}

var _collisions = [];
for(var i=0;i<array_length(_collidables);i++) {
	for(var j=i+1;j<array_length(_collidables);j++) {
		if(_collidables[i].mass != infinity || _collidables[j].mass != infinity) {
			var _intersections = _collidables[i].transformed_polygon.getIntersectionsWithPolygon(_collidables[j].transformed_polygon);
			for(var k=0;k<array_length(_intersections);k+=2) {
				var _col = new Collision(_intersections[k], _intersections[k+1], _collidables[i], _collidables[j]);
				//array_push(lines_to_draw, [_col.location, add(_col.location,scale(_col.unit_normal, 100))]);
				//queue_line_draw(_col.location, add(_col.location, scale(_col.unit_normal, 100)));
				array_push(_collisions, _col);
			}
		}
	}
}

for(var i=0;i<array_length(_collisions);i++) {
	_collisions[i].calculate_force();
	_collisions[i].apply();
	delete _collisions[i];
}

/*
	with(instance_id[i]) {
		if(object_index != obj_collidable) continue;
		var _cx = camera_get_view_x(view_camera[0]);
		var _cy = camera_get_view_y(view_camera[0]);
		var _cw = camera_get_view_width(view_camera[0]);
		var _ch = camera_get_view_height(view_camera[0]);
		if(x < _cx || x > _cx+_cw || y < _cy || y > _cy+_ch) continue;
		for(var j=i+1;j<array_length(instance_id);j++) {
				
		}
	}
}*/