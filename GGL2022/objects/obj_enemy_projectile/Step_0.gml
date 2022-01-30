event_inherited();
x += velocity[0];
y += velocity[1];

if(timer > 0) {
	timer--;	
} else {
	image_alpha -= 1/60;

	if(image_alpha <= 0) instance_destroy();
}
