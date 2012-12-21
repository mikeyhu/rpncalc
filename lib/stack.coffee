stack = exports? and exports or @stack = {}

stack.createStack = (numeric = true) ->
	items:[]
	push:(value) ->
		if numeric and isNaN parseFloat(value) then throw stack.INVALID_NUMERIC
		@items.unshift if numeric then parseFloat(value) else value
		value
	all:() ->
		@items
	peek:() ->
		@items[0]
	pop:(num) ->
		if @items.length < num then throw stack.TO_FEW_ON_STACK
		@items.splice(0,num)

stack.TO_FEW_ON_STACK = "toFewOnStack"
stack.INVALID_NUMERIC = "invalidNumeric"

