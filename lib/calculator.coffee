stack = require './stack.coffee'
tokeniser = require './tokeniser.coffee'

exports.createCalculator = () ->
	mem: stack.createStack()

	push:(value) ->
		@mem.push(value)
	stack:() ->
		@mem.all()
	applyFunction:(num,fun) ->
		v=@mem.pop(num)
		@mem.push(fun(v))
	add:() ->
		@applyFunction(2,(v) -> v[0]+v[1])
	minus:() ->
		@applyFunction(2,(v) -> v[1]-v[0])
	multiply:() ->
		@applyFunction(2,(v) -> v[1]*v[0])
	divide:() ->
		@applyFunction(2,(v) -> v[1]/v[0])

	input:(element) ->
		switch element
			when "+" then @add()
			when "-" then @minus()
			when "/" then @divide()
			when "*" then @multiply()
			else @push(element)

	parse:(data) ->
		t = tokeniser.createTokeniser(data)
		while t.hasNext()
			@input(t.next())
		@mem.peek()

	convertToken:(element) ->
		if isNaN parseFloat(element) 
			v=@mem.pop(2)
			@mem.pushString("(#{v[1]} #{element} #{v[0]})")
		else
			@mem.push(element)

	convert:(data) ->
		t = tokeniser.createTokeniser(data)
		while t.hasNext()
			@convertToken(t.next())
		@mem.peek()


