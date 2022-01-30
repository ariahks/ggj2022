/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(instance_exists(obj_thing) && obj_thing.alive && distance_to_object(obj_thing) < max_range)
{
	target_in_range = true;
	//direction = lerp(point_direction(x, y, obj_thing.x, obj_thing.y), direction, 0.91);
	direction = point_direction(x, y, obj_thing.x, obj_thing.y);
	
	
	shoot_alarm++;
	if(shoot_alarm > shoot_alarm_max)
	{
		with(instance_create_depth(x, y, depth-1, obj_gazer_projectile)) 
		{
			source = other;
			//velocity[0] = 4 * dcos(other.direction);
			//velocity[1] = -4 * dsin(other.direction);
		}
		shoot_alarm = 0;
	}
} else {
	target_in_range = false;
}


var _y_offset = 24*sin(current_time * 0.0018);
y = ystart+_y_offset;

if(target_in_range && sprite_index == spr_gazer_closed && image_speed == 0) {
	image_index = 0;
	image_speed = 1;
} else if(!target_in_range && sprite_index == spr_gazer) {
	sprite_index = spr_gazer_closed;
	image_index = image_number-1;
	image_speed = -1;
}

if(image_speed == -1 && image_index <= 1) {
	image_speed = 0;
}
if(image_speed == 1 && image_index >= image_number-1) {
	image_speed = 0;
	image_index = 0;
	sprite_index = spr_gazer;
}

if(sprite_index == spr_gazer_closed) shoot_alarm = 110;