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

key_a = keyboard_check_pressed(ord("A"));
key_d = keyboard_check_pressed(ord("D"));

//if(key_a) apply_force([1, -1], -1);
//if(key_d) apply_force([-1, -1], 1);

cooldown_a = max(0, cooldown_a-1);
cooldown_d = max(0, cooldown_d-1);

if(key_a && cooldown_a == 0) {
	cooldown_a = 5;
	fire([-1, 1], [-1, 0]);
	angel_rotation_vel = -0.4;
	wing_devil_index = 1;
	if(wing_devil_timer == 0) wing_devil_timer = 15;
}
if(key_d && cooldown_d == 0) {
	cooldown_d = 5;
	fire([1, 1], [1, 0]);
	devil_rotation_vel = -0.4;
	wing_angel_index = 1;
	if(wing_angel_timer == 0) wing_angel_timer = 15;
}

if(wing_angel_timer == 0) wing_angel_index = 0;
if(wing_devil_timer == 0) wing_devil_index = 0;

wing_angel_timer = max(0, wing_angel_timer-1);
wing_devil_timer = max(0, wing_devil_timer-1);




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