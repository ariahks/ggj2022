function add(_vec1, _vec2) {
	return [_vec1[0] + _vec2[0], _vec1[1] + _vec2[1]];
}


function norm(_vec) {
	return sqrt(_vec[0]^2 + _vec[1]^2);
}

function rotate(_vec, _angle) {
	return [_vec[0]*cos(_angle)-_vec[1]*sin(_angle),
			_vec[0]*sin(_angle)+_vec[1]*cos(_angle)];
}

function scale(_vec, _scalar) {
	return [_vec[0]*_scalar, _vec[1]*_scalar];	
}