if(!alive)
{
	velocity[0] = 0;
	velocity[1] = -7;
	
	velocity_angular = -0.02;
	
	devil_rotation_vel = 0;
	angel_rotation_vel = 0;
	
	angel_rotation = 0;
	devil_rotation = 0;
	
	angle = 0;
	exit;
}

if(norm(velocity) > max_velocity) {
	velocity = scale(velocity, max_velocity/norm(velocity));
}

x += velocity[0];
y += velocity[1];


angel_rotation_vel += (0.2 - angel_rotation) / 100;
devil_rotation_vel += (0.2 - devil_rotation) / 100;
angel_rotation_vel *= 0.999;
devil_rotation_vel *= 0.999;

angel_rotation += angel_rotation_vel;
devil_rotation += devil_rotation_vel;


/*var max_speed = 10;


velocity[0] = clamp(velocity[0], -max_speed, max_speed);
velocity[1] = clamp(velocity[1], -max_speed, max_speed);
velocity_angular = clamp(velocity_angular, -1, 1);*/

velocity = scale(velocity, frict);

//velocity[1] += 0.4
applyForceRel(scale([0, grav], mass), [0, 0]);

//show_debug_message(getKineticEnergy());

angle += velocity_angular;

velocity_angular *= frict_angular;

key_angel = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("M"));
key_devil = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));

//if(key_a) apply_force([1, -1], -1);
//if(key_d) apply_force([-1, -1], 1);

cooldown_angel = max(0, cooldown_angel-1);
cooldown_devil = max(0, cooldown_devil-1);

if(key_devil && cooldown_devil == 0) {
	cooldown_devil = 7;
	fire([-1, 1], [-1, 0], obj_proj_devil);
	angel_rotation_vel = -0.4;
	wing_devil_index = 1;
	if(wing_devil_timer == 0) wing_devil_timer = 15;
}
if(key_angel && cooldown_angel == 0) {
	cooldown_angel = 7;
	fire([1, 1], [1, 0], obj_proj_angel);
	devil_rotation_vel = -0.4;
	wing_angel_index = 1;
	if(wing_angel_timer == 0) wing_angel_timer = 15;
}

if(wing_angel_timer == 0) wing_angel_index = 0;
if(wing_devil_timer == 0) wing_devil_index = 0;

wing_angel_timer = max(0, wing_angel_timer-1);
wing_devil_timer = max(0, wing_devil_timer-1);

if(bonk_timer > 0) {
	sprite_angel_index = 1;
} else {
	sprite_angel_index = 0;
	sprite_angel = spr_angel;
	sprite_devil = spr_devil;
}

bonk_timer = max(0, bonk_timer-1);

/*x += velocity[0];
y += velocity[1];

var max_speed = 10;

velocity[0] = clamp(velocity[0], -max_speed, max_speed);
velocity[1] = clamp(velocity[1], -max_speed, max_speed);

velocity = scale(velocity, frict);

velocity[1] += 0.4

angle -= velocity_angular;

velocity_angular *= frict_angular;

key_a = keyboard_check_pressed(ord("A"));
key_d = keyboard_check_pressed(ord("D"));

//if(key_a) apply_force([1, -1], -1);
//if(key_d) apply_force([-1, -1], 1);

cooldown_a = max(0, cooldown_a-1);
cooldown_d = max(0, cooldown_d-1);

if(key_a && cooldown_a == 0) {
	cooldown_a = 5;
	fire([-1, 1], -1);
}
if(key_d && cooldown_d == 0) {
	cooldown_d = 5;
	fire([1, 1], 1);
}
*/