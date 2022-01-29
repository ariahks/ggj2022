event_inherited();
mass = 0.3;
inertia = 3000;

frict = 1-0.015;
frict_angular = 1-0.04;
fire_distance_from_center = 50;
force_from_shot = 3;
grav = 0.3;
max_velocity = 20;

wing_angel_index = 0;
wing_devil_index = 0;
wing_angel_speed = 2/60;
wing_devil_speed = 2/60;

devil_rotation = 0
angel_rotation = 0
devil_rotation_vel = 0
angel_rotation_vel = 0

var _p1 = [-sprite_width/2, -sprite_height/2]
var _p2 = [sprite_width/2, -sprite_height/2]
var _p3 = [sprite_width/2, sprite_height/2]
var _p4 = [-sprite_width/2, sprite_height/2]
polygon = new Polygon([_p1, _p2, _p3, _p4]);

function fire(_dir, _pos) {
	applyForceRel(rotate(scale(_dir, -force_from_shot), angle), scale(_pos, fire_distance_from_center));
	var _proj_pos = add(rotate([_pos[0]*78,16], angle), [x,y]);
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