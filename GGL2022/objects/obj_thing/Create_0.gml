velocity = [0, 0];
velocity_angular = 0;
angle = -3.1415/2;
mass = 1;
inertia = 100;

frict = 0.03;
frict_angular = 0.02;


///@arg force 2d vector as a 1d array
///@arg pos 1d coordinate
function apply_force(_force, _pos) {
	velocity = scale(add(rotate(_force, -angle), velocity), 1/mass);
	velocity_angular += _pos*_force[1] * 1/inertia;
}