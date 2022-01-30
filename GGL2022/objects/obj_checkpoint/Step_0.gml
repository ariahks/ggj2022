/// @description Insert description here
// You can write your code in this editor

image_index = chosen;

with(instance_place(x, y, obj_thing))
{
	if(!other.activated) {
		obj_checkpoint.chosen = false;
		other.chosen = true;
		other.activated = true;
	}
}

if(chosen && !obj_thing.alive && !instance_exists(obj_transition))
{
	with(instance_create_depth(0, 0, 0, obj_transition)) {
		sprite_index = spr_transition_diamond;
		trans_color = $000000;
		dest_x = other.x;
		dest_y = other.y;
		//dest_room = room;
	}
	//view_object[0] = obj_thing;
}