exports.createStack = () ->
	items:[]
	push:(value) ->
		@items.unshift(value)
	all:() ->
		@items.reverse()
	peek:() ->
		@items[0]
	pop:(num) ->
		@items.splice(0,num)

