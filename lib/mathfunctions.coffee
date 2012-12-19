mathfun = exports? and exports or @mathfun = {}

mathfun.lookup = (token) -> (arg for ex,arg of mathfun.FUNCTIONS when ex is token)[0]
	
mathfun.FUNCTIONS =
	'+' : arg:2, fun:(d) -> d[1] + d[0]
	'-' : arg:2, fun:(d) -> d[1] - d[0]
	'*' : arg:2, fun:(d) -> d[1] * d[0]
	'/' : arg:2, fun:(d) -> d[1] / d[0]

