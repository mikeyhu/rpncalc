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


