tokeniser = exports? and exports or @tokeniser = {}

tokeniser.createTokeniser = (tokens) ->
	all:tokens.match(/(\w+|\+|\\|\-|\*)/g)
	num:0
	next:() -> @all[@num++]
	hasNext:() -> @num < @all.length
			
