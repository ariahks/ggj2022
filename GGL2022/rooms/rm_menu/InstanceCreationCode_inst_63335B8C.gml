page[0] = new Page([
	new Option("Play",
		function() {
			room_goto_next();
		}
	),
	new Option("Settings",
		function() {
			index = 1;
		}
	),
	new Option("Quit Game",
		function() {
			game_end();	
		}
	)
]);

page[1] = new Page([
	new Option("Window Size",
		function() {
			var _res = string(1600*global.scales[global.scale_index]) + "x" + string(900*global.scales[global.scale_index]);
			page[2].options[0].str = (global.scale_index == 0 ? "  " : "< ")+_res+(global.scale_index == array_length(global.scales)-1 ? "  " : " >");
			page[2].options[1].str = (global.fullscreen ? "< Fullscreen  " : "  Windowed >");
			index = 2;
		}
	),
	new Option("Audio",
		function() { 
			page[3].options[0].str = "Music "+(global.vol_music == 0 ? "  " : "< ")+string(global.vol_music)+(global.vol_music == 100 ? "  " : " >");
			page[3].options[1].str = "Sounds "+(global.vol_sounds == 0 ? "  " : "< ")+string(global.vol_sounds)+(global.vol_sounds == 100 ? "  " : " >");
			index = 3;
		}
	),
	new Option("Back",
		function() { index = 0; }
	)
]);

page[2] = new Page([
	new Option("WINDOW",, //skip func
		function() { //left
			if(global.scale_index > 0) global.scale_index--;
			var _res = string(1600*global.scales[global.scale_index]) + "x" + string(900*global.scales[global.scale_index]);
			page[2].options[0].str = (global.scale_index == 0 ? "  " : "< ")+_res+(global.scale_index == array_length(global.scales)-1 ? "  " : " >");
			window_set_size(1600*global.scales[global.scale_index], 900*global.scales[global.scale_index]);
			window_set_position((display_get_width() - 1600*global.scales[global.scale_index])/2, (display_get_height() - 900*global.scales[global.scale_index])/2);
		},
		function() { //right
			if(global.scale_index < array_length(global.scales)-1) global.scale_index++;
			var _res = string(1600*global.scales[global.scale_index]) + "x" + string(900*global.scales[global.scale_index]);
			page[2].options[0].str = (global.scale_index == 0 ? "  " : "< ")+_res+(global.scale_index == array_length(global.scales)-1 ? "  " : " >");
			window_set_size(1600*global.scales[global.scale_index], 900*global.scales[global.scale_index]);
			window_set_position((display_get_width() - 1600*global.scales[global.scale_index])/2, (display_get_height() - 900*global.scales[global.scale_index])/2);
		}
	),
	new Option("FULLSCREEN",, //skip func
		function() { //left
			if(global.fullscreen) {
				global.fullscreen = false;
				page[2].options[1].str = "  Windowed >";
				window_set_fullscreen(false);
				window_set_size(1600*global.scales[global.scale_index], 900*global.scales[global.scale_index]);
				window_set_position((display_get_width() - 1600*global.scales[global.scale_index])/2, (display_get_height() - 900*global.scales[global.scale_index])/2);
			}
		},
		function() { //right
			if(!global.fullscreen) {
				global.fullscreen = true;
				page[2].options[1].str = "< Fullscreen  ";	
				window_set_fullscreen(true);
			}
		}
	),
	new Option("Back",
		function() {
			index = 1;	
		}
	)
]);

page[3] = new Page([
	new Option("MUSIC",, //skip func
		function() { //left
			if(global.vol_music > 0) {
				global.vol_music = max(0, global.vol_music-10);	
				page[3].options[0].str = "Music "+(global.vol_music == 0 ? "  " : "< ")+string(global.vol_music)+" >";
			}
		},
		function() { //right
			if(global.vol_music < 100) {
				global.vol_music = min(100, global.vol_music+10);	
				page[3].options[0].str = "Music < "+string(global.vol_music)+(global.vol_music == 100 ? "  " : " >");
			}
		}
	),
	new Option("SOUNDS",, //skip func
		function() { //left
			if(global.vol_sounds > 0) {
				global.vol_sounds = max(0, global.vol_sounds-10);	
				page[3].options[1].str = "Sounds "+(global.vol_sounds == 0 ? "  " : "< ")+string(global.vol_sounds)+" >";
			}
		},
		function() { //right
			if(global.vol_sounds < 100) {
				global.vol_sounds = min(100, global.vol_sounds+10);	
				page[3].options[1].str = "Sounds < "+string(global.vol_sounds)+(global.vol_sounds == 100 ? "  " : " >");
			}
		}
	),
	new Option("Back",
		function() {
			index = 1;	
		}
	)
]);