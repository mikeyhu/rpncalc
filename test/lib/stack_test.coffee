should = require 'should'
stack = require '../../lib/stack.coffee'


describe 'A stack', ->
	it 'should be able to return the whole stack', ->
		s = stack.createStack()
		s.all().should.eql([])
	it 'should be able to have an item added to it and viewed', ->
		s = stack.createStack()
		s.push(1)
		s.all().should.eql([1])
	it 'should be able to have items added to it and the whole of the stack should be viewable', ->
		s = stack.createStack()
		s.push(1)
		s.push(2)
		s.push(3)
		s.all().should.eql([3,2,1])
	it 'an item pushed to the stack should be peekable', ->
		s = stack.createStack()
		s.push(1)
		s.push(2)
		s.peek().should.equal(2)
	it 'an item pushed to the stack should be popable as an array', ->
		s = stack.createStack()
		s.push(1)
		s.push(2)
		s.push(3)
		s.push(4)
		s.pop(2).should.eql([3,4])
		s.pop(1).should.eql([2])
	it 'popping more items on the stack than available should throw an exception', ->
		s = stack.createStack()
		s.push(1)
		throwsException =
			try
		 		s.pop(2)
		 		false
			catch err
				console.log err
				if err==stack.TO_FEW_ON_STACK then true
				else false
		throwsException.should.equal(true)
	it 'pushing a string onto the stack should throw an exception', ->
		s = stack.createStack()
		throwsException =
			try
		 		s.push("a")
		 		false
			catch err
				if err==stack.INVALID_NUMERIC then true
				else false
		throwsException.should.equal(true)
	it 'should be able to have an item added to it and should return the value', ->
		s = stack.createStack(false)
		s.push("10").should.equal("10")
	it 'should be possible to push a string onto a stack', ->
		s = stack.createStack(false)
		s.push("5 + 4").should.equal("5 + 4")
		s.pop(1).should.eql(["5 + 4"])



