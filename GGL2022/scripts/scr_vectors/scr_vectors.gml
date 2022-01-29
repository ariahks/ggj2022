function add(_vec1, _vec2) {
	return [_vec1[0] + _vec2[0], _vec1[1] + _vec2[1]];
}


function norm(_vec) {
	return sqrt(sqr(_vec[0]) + sqr(_vec[1]));
}

function rotate(_vec, _angle) {
	return [_vec[0]*cos(-_angle)-_vec[1]*sin(-_angle),
			_vec[0]*sin(-_angle)+_vec[1]*cos(-_angle)];
}

function scale(_vec, _scalar) {
	return [_vec[0]*_scalar, _vec[1]*_scalar];	
}

function distance(_vec1, _vec2) {
	return norm(add(_vec1, scale(_vec2, -1)));	
}

function cross(_vec1, _vec2) {
	return norm(_vec1) * norm(_vec2) * sin(vec_angle(_vec2) - vec_angle(_vec1));
}

function dot(_vec1, _vec2) {
	return _vec1[0] * _vec2[0] + _vec1[1] * _vec2[1];	
}

function vec_angle(_vec) {
	return arctan2(_vec[1], _vec[0]);
}