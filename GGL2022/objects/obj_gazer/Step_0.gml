/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_thing) && distance_to_object(obj_thing) < max_range)
{
	//direction = lerp(point_direction(x, y, obj_thing.x, obj_thing.y), direction, 0.91);
	direction = point_direction(x, y, obj_thing.x, obj_thing.y);
	

	shoot_alarm++;
	if(shoot_alarm > shoot_alarm_max)
	{
		with(instance_create_depth(x, y, depth-1, obj_enemy_projectile)) 
		{
			source = other;
			//velocity[0] = 4 * dcos(other.direction);
			//velocity[1] = -4 * dsin(other.direction);
		}
		shoot_alarm = 0;
	}
}


var _y_offset = 24*sin(current_time * 0.0018);
y = ystart+_y_offset;