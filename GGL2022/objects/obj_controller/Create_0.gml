depth = -999;
randomize();
generate_tile_variety();

lines_to_draw = [];

function queue_line_draw(_vec1, _vec2) {
	array_push(lines_to_draw, [_vec1, _vec2]);
}