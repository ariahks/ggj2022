if(instance_exists(obj_c_angel) && alpha < 1) alpha += 0.05;
else if(!instance_exists(obj_c_angel) && alpha > 0) alpha -= 0.05;

if(alpha == 0) instance_destroy();