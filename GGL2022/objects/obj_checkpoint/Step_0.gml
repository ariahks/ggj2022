/// @description Insert description here
// You can write your code in this editor

//image_index = chosen;

with(instance_place(x, y, obj_thing))
{
	if(!other.activated) {
		obj_checkpoint.chosen = false;
		other.chosen = true;
		other.activated = true;
	}
}

if(chosen and obj_thing.alive == false and instance_exists(obj_explosion) == false)
{
	obj_thing.x = x;
	obj_thing.y = y+50;
	obj_thing.alive = true;
	view_object[0] = obj_thing;
}