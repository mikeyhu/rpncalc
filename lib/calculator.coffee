stack = require './stack.coffee'
tokeniser = require './tokeniser.coffee'
mathfunctions = require './mathfunctions.coffee'

exports.createCalculator = () ->
	mem: stack.createStack()

	push:(value) ->
		@mem.push(value)
	stack:() ->
		@mem.all()
	applyFunction:(num,fun) ->
		v=@mem.pop(num)
		@mem.push(fun(v))
	input:(element) ->
		if isNaN parseFloat(element)
			t = mathfunctions.lookup(element)
			@applyFunction(t.arg, t.fun)
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


