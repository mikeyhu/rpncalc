exports.createStack = () ->
	items:[]
	push:(value) ->
		if isNaN parseFloat(value) then throw exports.INVALID_NUMERIC
		@items.unshift(parseFloat(value))
		value
	pushString:(value) ->
		@items.unshift(value)
		value
	all:() ->
		@items
	peek:() ->
		@items[0]
	pop:(num) ->
		if @items.length < num then throw exports.TO_FEW_ON_STACK
		@items.splice(0,num)

exports.TO_FEW_ON_STACK = "toFewOnStack"
exports.INVALID_NUMERIC = "invalidNumeric"

