/// @description Insert description here
// You can write your code in this editor
event_inherited();
with(instance_place(x, y, obj_projectile))
{
	instance_create_depth(other.x, other.y, -9999, obj_little_explosion);
	instance_destroy(other);
}