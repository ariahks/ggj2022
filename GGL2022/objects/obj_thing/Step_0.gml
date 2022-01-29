x += velocity[0];
y += velocity[1];

velocity[0] = lerp(velocity[0], 0, frict);
velocity[1] = lerp(velocity[1], 0, frict);

angle -= velocity_angular;

velocity_angular = lerp(velocity_angular, 0, frict_angular);

key_a = keyboard_check_pressed(ord("A"));
key_d = keyboard_check_pressed(ord("D"));

if(key_a) apply_force([1, -1], -1);
if(key_d) apply_force([-1, -1], 1);