event_inherited();

angle = 3.1415/2;
//angle = 0;
mass = 0.3;
inertia = 20;

frict = 0.999;
frict_angular = 0.93;

var _p1 = [-sprite_width/2, -sprite_height/2]
var _p2 = [sprite_width/2, -sprite_height/2]
var _p3 = [sprite_width/2, sprite_height/2]
var _p4 = [-sprite_width/2, sprite_height/2]
polygon = new Polygon([_p1, _p2, _p3, _p4]);

function fire(_dir, _pos) {
	applyForceRel(rotate(scale(_dir, -1), angle), _pos);
	var _proj_pos = add(rotate([_pos[0]*(sprite_width/2-96),0], angle), [x,y]);
	with(instance_create_depth(_proj_pos[0], _proj_pos[1], depth+1, obj_projectile)) {
		velocity = rotate(scale(_dir, 4), other.angle);
	}
}
cooldown_a = 0;
cooldown_d = 0;


/*velocity = [0, 0];
velocity_angular = 0;
mass = 0.09;
inertia = 30;


cooldown_a = 0;
cooldown_d = 0;


///@arg force 2d vector as a 1d array
///@arg pos 1d coordinate
function apply_force(_force, _pos) {
	velocity = add(scale(rotate(_force, -angle), 1/mass), velocity);
	velocity_angular += _pos*_force[1] * 1/inertia;
}

///@arg direction
///@arg position
function fire(_dir, _pos) {
	apply_force(scale(_dir, -1), _pos);
	var _proj_pos = add(rotate([_pos*(sprite_width/2-96),0], -angle), [x,y]);
	with(instance_create_depth(_proj_pos[0], _proj_pos[1], depth+1, obj_projectile)) {
		velocity = rotate(scale(_dir, 4), -other.angle);
	}
}*/