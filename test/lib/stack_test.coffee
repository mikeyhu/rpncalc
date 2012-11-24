require 'should'
assert = require 'assert'
stack = require '../../lib/stack.coffee'


describe 'A stack', ->
	it 'should be able to return the whole stack', ->
		s = stack.createStack()
		assert.deepEqual(s.all(),[])
	it 'should be able to have an item added to it and viewed', ->
		s = stack.createStack()
		s.push(1)
		assert.deepEqual(s.all(),[1])
	it 'should be able to have items added to it and the whole of the stack should be viewable', ->
		s = stack.createStack()
		s.push(1)
		s.push(2)
		s.push(3)
		assert.deepEqual(s.all(),[3,2,1])
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
		assert.deepEqual(s.pop(2),[4,3])
		assert.deepEqual(s.pop(1),[2])
	it 'popping more items on the stack than available should throw an exception', ->
		s = stack.createStack()
		s.push(1)
		throwsException =
			try
		 		s.pop(2)
		 		"b".should.equal("d")
		 		false
			catch err
				true
		throwsException.should.equal(true)
	it 'should be able to have an item added to it and should return the value', ->
		s = stack.createStack()
		s.push(10).should.equal(10)




