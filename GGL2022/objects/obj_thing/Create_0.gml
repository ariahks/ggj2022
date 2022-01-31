event_inherited();
mass = 0.3;
inertia = 3000;

frict = 1-0.015;
frict_angular = 1-0.04;
fire_distance_from_center = 50;
force_from_shot = 3;
grav = 0.3;
max_velocity = 20;

bonk_timer = 0;

sprite_angel = spr_angel;
sprite_devil = spr_devil;
sprite_angel_index = 0;
sprite_devil_index = 0;


wing_angel_index = 0;
wing_devil_index = 0;
wing_angel_timer = 0;
wing_devil_timer = 0;

devil_rotation = 0;
angel_rotation = 0;
devil_rotation_vel = 0;
angel_rotation_vel = 0;

alive = true;

var _tl = [-sprite_width/2+8, -sprite_height/2];

var _p1 = add(_tl, [0, 100]);
var _p2 = add(_tl, [100, 100]);
var _p3 = add(_tl, [136, 136]);
var _p4 = add(_tl, [180, 136]);
var _p5 = add(_tl, [200, 64]);
var _p6 = add(_tl, [190, 28]);
var _p7 = add(_tl, [148, 20]);
var _p8 = add(_tl, [142, 0]);
var _p9 = add(_tl, [100, 0]);
var _p10 = add(_tl, [100, 36]);
var _p11 = add(_tl, [0, 36]);
polygon = new Polygon([_p1, _p2, _p3, _p4, _p5, _p6, _p7, _p8, _p9, _p10, _p11]);

/*
var _p1 = _tl;
var _p2 = add(_tl, [sprite_width, 0]);
var _p3 = add(_tl, [sprite_width, sprite_height]);
var _p4 = add(_tl, [0, sprite_height]);
polygon = new Polygon([_p1, _p2, _p3, _p4]);
*/

function fire(_dir, _pos, _obj) {
	if(image_alpha == 0) return;
	var _snd = audio_play_sound((_obj == obj_proj_angel ? snd_shine : snd_fire), 8, false);
	audio_sound_pitch(_snd, random_range(0.9,1.1));
	audio_sound_gain(_snd, global.vol_sounds/100, 0);
	
	var _proj_pos = add(rotate([_pos[0]*78,16], angle), [x,y]);
	with(instance_create_depth(_proj_pos[0], _proj_pos[1], 900, _obj)) {
		velocity = add(scale(other.velocity, 0), rotate(scale(_dir, 1), other.angle));
		var _min_proj_speed = 10;
		if(norm(velocity) == 0) velocity = rotate(scale(_dir, 1), other.angle); //To avoid crashes
		if(norm(velocity) < _min_proj_speed) velocity = scale(velocity, _min_proj_speed/norm(velocity));
	}
	applyForceRel(rotate(scale(_dir, -force_from_shot), angle), scale(_pos, fire_distance_from_center));
}
cooldown_angel = 0;
cooldown_devil = 0;

function bonk() {
	var _snd = audio_play_sound(snd_bonk, 8, false);
	audio_sound_pitch(_snd, random_range(0.9,1.1));
	audio_sound_gain(_snd, global.vol_sounds/100, 0);
	bonk_timer = 30;
	sprite_angel = spr_angel_bonk;
	sprite_devil = spr_devil_bonk;
	//change sprite to bonk sprite
	//play sound eventually
}

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