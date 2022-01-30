if(place_meeting(x, y, obj_thing)) {
	with(instance_create_depth(0, 0, 0, obj_transition)) {
		sprite_index = spr_transition_diamond;
		dest_room = room_next(room);
		trans_color = $000000;
	}
}

var _max_range = 700;
var _towards_portal = add([x, y], scale([obj_thing.x, obj_thing.y], -1));
var _force_stregth = 40000/max(100000, power(norm(_towards_portal), 2));
if(norm(_towards_portal) <= _max_range) {
	obj_thing.applyForce(scale(_towards_portal, _force_stregth/norm(_towards_portal)), [obj_thing.x, obj_thing.y]);
}