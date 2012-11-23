exports.createStack = () ->
	items:[]
	push:(value) ->
		@items.unshift(value)
	all:() ->
		@items.reverse()

