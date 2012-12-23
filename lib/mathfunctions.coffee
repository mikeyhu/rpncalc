mathfun = exports? and exports or @mathfun = {}

mathfun.lookup = (token) -> (arg for ex,arg of mathfun.FUNCTIONS when ex is token)[0]
	
mathfun.FUNCTIONS =
	'+' : 
		arg:2
		fun:(d) 	-> d[0] + d[1]
		latex:(d) 	-> "#{d[0]}+#{d[1]}"
	'-' :
		arg:2
		fun:(d) 	-> d[0] - d[1]
		latex:(d)	-> "#{d[0]}-#{d[1]}"
	'*' : 
		arg:2
		fun:(d) 	-> d[0] * d[1]
		latex:(d) 	-> "#{d[0]}\\times#{d[1]}"
	'/' : 
		arg:2
		fun:(d) 	-> d[0] / d[1]
		latex:(d) 	-> "\\frac{#{d[0]}}{#{d[1]}}"

