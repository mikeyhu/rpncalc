stack = require './stack.coffee'

exports.createCalculator = () ->
	mem: stack.createStack()

	push:(value) ->
		@mem.push(value)
	stack:() ->
		@mem.all()

	add:() ->
		v=@mem.pop(2)
		result=v[0]+v[1]
		@mem.push(result)
		result
	minus:() ->
		v=@mem.pop(2)
		@mem.push(v[1]-v[0])
	multiply:() ->
		v=@mem.pop(2)
		@mem.push(v[1]*v[0])
	divide:() ->
		v=@mem.pop(2)
		@mem.push(v[1]/v[0])

	input:(element) ->
		switch element
			when "+" then @add()
			when "-" then @minus()
			when "/" then @divide()
			when "*" then @multiply()
			else @push(+element)

	parse:(data) ->
		@input(element) for element in data.split(" ")

