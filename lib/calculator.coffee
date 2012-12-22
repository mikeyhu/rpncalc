if require?
	stack = require './stack.coffee'
	tokeniser = require './tokeniser.coffee'
	mathfun = require './mathfunctions.coffee'
calculator = exports? and exports or @calculator = {}

calculator.createCalculator = () ->
	mem: stack.createStack(true)
	dis: stack.createStack(false)

	push:(value) ->
		@mem.push value
		@dis.push value
	stack:() -> @mem.all()
	applyFunction:(values,arg,fun) -> values.push fun(values.pop arg)
	input:(element) ->
		tokenInfo = mathfun.lookup(element)
		if tokenInfo?
			@applyFunction @dis,tokenInfo.arg,tokenInfo.latex
			@applyFunction @mem,tokenInfo.arg,tokenInfo.fun
		else @push element
	parse:(data) ->
		t = tokeniser.createTokeniser(data)
		while t.hasNext()
			@input t.next()
		@mem.peek()
	display:() -> @dis.peek()
	answer:() -> @mem.peek()




