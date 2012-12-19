exports.lookup = (token) -> (arg for ex,arg of exports.FUNCTIONS when ex is token)[0]
	
exports.FUNCTIONS =
	'+' : arg:2, fun:(d) -> d[1] + d[0]
	'-' : arg:2, fun:(d) -> d[1] - d[0]
	'*' : arg:2, fun:(d) -> d[1] * d[0]
	'/' : arg:2, fun:(d) -> d[1] / d[0]

