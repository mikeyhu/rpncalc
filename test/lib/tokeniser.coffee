require 'should'
assert = require 'assert'
tokeniser = require '../../lib/tokeniser.coffee'

describe 'a tokeniser',() ->
	it 'should be able to be set with a string', ->
		t = tokeniser.createTokeniser('abc xyz')
	it 'should be able to retrieve the first element of a string', ->
		t = tokeniser.createTokeniser('abc xyz')
		t.next().should.equal('abc')
	it 'should be able to retrieve the second element of a string', ->
		t = tokeniser.createTokeniser('abc xyz 123')
		t.next()
		t.next().should.equal('xyz')
	it 'should be able to tell if there is a next token', ->
		t = tokeniser.createTokeniser('abc xyz')
		t.hasNext().should.equal(true)
		t.next()
		t.next()
		t.hasNext().should.equal(false)		
