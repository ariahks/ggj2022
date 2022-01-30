/// @description Insert description here
// You can write your code in this editor

//set textboxes coords

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

t_a.x = x+100;
t_a.y = y+30;
t_d.x = x+100;
t_d.y =y+640;

if(!ds_queue_empty(global.text_que)){
	timer--;
	if(timer<=0){
		timer = timer_speed;
		cur_text = ds_queue_dequeue(global.text_que);
		if(string_char_at(cur_text,1)=="D"){
			t_d.text = string_copy(cur_text,2,string_length(cur_text)-1);
			t_d.image_alpha = 1;
			t_d.index = 0;
			t_d.display = "";
			t_d.is_devil = true;
		}
		else if(string_char_at(cur_text,1)=="A"){
			t_a.text = string_copy(cur_text,2,string_length(cur_text)-1);
			t_a.image_alpha = 1;
			t_a.index = 0;
			t_a.display = "";
			t_a.is_devil = false;
		}
	}
}
else if(t_a.timer<=0&&t_d.timer<=0){
	t_a.image_alpha = 0;
	timer = 0;
	t_d.image_alpha = 0;
	t_a.display = "";
	t_a.index = "";
	t_a.text = "";
	t_d.display = "";
	t_d.index = "";
	t_d.text = "";
}



