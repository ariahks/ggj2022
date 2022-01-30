function generate_tile_variety() {
	var _layer = layer_tilemap_get_id(layer_get_id("Tiles"));
	for(var i=0;i<tilemap_get_width(_layer);i++) {
		for(var j=0;j<tilemap_get_height(_layer);j++) {
			var _offset = irandom(3) * 60; //(0, 1, 2, or 3) * 60
			var _tile = tilemap_get(_layer, i, j);
			if(_tile >= 1 && _tile <= 47) { //generic, please generate
				tilemap_set(_layer, _tile+_offset,i,j);
			}
		}
	}
}