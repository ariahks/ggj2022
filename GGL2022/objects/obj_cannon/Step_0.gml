/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_thing) and distance_to_object(obj_thing) < 350)
{
	direction = lerp(point_direction(x, y, obj_thing.x, obj_thing.y), direction, .9);
	

	shoot_alarm++;
	if(shoot_alarm > shoot_alarm_max)
	{
		with(instance_create_depth(x + (64 * dcos(other.direction)), y - (64 * dsin(other.direction)), depth+1, obj_enemy_projectile)) 
		{
			velocity[0] = 4 * dcos(other.direction);
			velocity[1] = -4 * dsin(other.direction);
		}
		shoot_alarm = 0;
	}
	
}
else
{
	if(traveling_right)
	{
		direction += 1;
	}
	else
	{
		direction -= 1;
	}
}
if(direction > 170)
{
	traveling_right = false;
	direction = 170;
}

if(direction < 10)
{
	traveling_right = true;
	direction = 10;
}