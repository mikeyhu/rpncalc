require 'should'
assert = require 'assert'
math = require '../../lib/mathfunctions.coffee'
describe 'Mathfunctions', ->
	it 'should be able to lookup a function and find the number of elements it applies to', ->
		result = math.lookup('+')
		result.arg.should.equal(2)
	it 'should be able to lookup an + function and use it', ->
		result = math.lookup('+')
		result.fun([4,2]).should.equal(6)
	it 'should be able to lookup an - function and use it', ->
		result = math.lookup('-')
		result.fun([4,2]).should.equal(-2)
	it 'should be able to lookup an * function and use it', ->
		result = math.lookup('*')
		result.fun([4,2]).should.equal(8)
	it 'should be able to lookup an / function and use it', ->
		result = math.lookup('/')
		result.fun([4,2]).should.equal(0.5)
	it 'should be able to generate a simple string of latex', ->
		result = math.lookup('+')
		result.latex([4,2]).should.equal("2+4")
	it 'should be able to generate a simple string of latex', ->
		result = math.lookup('-')
		result.latex([4,2]).should.equal("2-4")
	it 'should be able to generate a string of latex from a division', ->
		result = math.lookup('/')
		result.latex([4,2]).should.equal("\\frac{2}{4}")
	it 'should be able to generate a string of latex from a multiplication', ->
		result = math.lookup('*')
		result.latex([4,2]).should.equal("2\\times4")

