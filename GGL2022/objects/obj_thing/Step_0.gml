x += velocity[0];
y += velocity[1];

var max_speed = 10;

velocity[0] = clamp(velocity[0], -max_speed, max_speed);
velocity[1] = clamp(velocity[1], -max_speed, max_speed);
velocity_angular = clamp(velocity_angular, -1, 1);

velocity = scale(velocity, frict);

//velocity[1] += 0.4
applyForceRel(scale([0, 0.1], mass), [0, 0]);


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
}
if(key_d && cooldown_d == 0) {
	cooldown_d = 5;
	fire([1, 1], [1, 0]);
}






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