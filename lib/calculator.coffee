if (require?) 
	stack = require './stack.coffee'
	tokeniser = require './tokeniser.coffee'
	mathfun = require './mathfunctions.coffee'
calculator = exports? and exports or @calculator = {}

calculator.createCalculator = () ->
	mem: stack.createStack()

	push:(value) ->
		@mem.push(value)
	stack:() ->
		@mem.all()
	applyFunction:(functionInfo) ->
		v=@mem.pop(functionInfo.arg)
		@mem.push(functionInfo.fun(v))
	input:(element) ->
		if isNaN parseFloat(element) then @applyFunction(mathfun.lookup(element))
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


