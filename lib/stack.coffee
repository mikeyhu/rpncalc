exports.createStack = () ->
	items:[]
	push:(value) ->
		@items.unshift(value)
		value
	all:() ->
		@items.reverse()
	peek:() ->
		@items[0]
	pop:(num) ->
		@items.splice(0,num)

exports.TO_FEW_ON_STACK = "toFewOnStack"

