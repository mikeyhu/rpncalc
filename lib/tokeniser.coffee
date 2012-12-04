exports.createTokeniser = (tokens) ->
	all:tokens.split(" ")
	num:0
	next:() -> @all[@num++]
	hasNext:() -> @num < @all.length
			
