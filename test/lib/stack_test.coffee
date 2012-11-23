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
		assert.deepEqual(s.pop(2),[3,2])
		assert.deepEqual(s.pop(2),[1])
	



