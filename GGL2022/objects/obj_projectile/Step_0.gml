if(instance_exists(obj_menu)) exit;

x += velocity[0];
y += velocity[1];

image_alpha -= 1/60;

if(image_alpha <= 0) instance_destroy();