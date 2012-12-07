require 'should'
assert = require 'assert'
tokeniser = require '../../lib/tokeniser.coffee'

describe 'a tokeniser',() ->
	it 'should be able to be set with a string', ->
		t = tokeniser.createTokeniser('123')
	it 'should be able to retrieve the first element of a string', ->
		t = tokeniser.createTokeniser('123 456')
		t.next().should.equal('123')
	it 'should be able to retrieve the second element of a string', ->
		t = tokeniser.createTokeniser('123 456 789')
		t.next()
		t.next().should.equal('456')
	it 'should be able to tell if there is a next token', ->
		t = tokeniser.createTokeniser('123 456')
		t.hasNext().should.equal(true)
		t.next()
		t.next()
		t.hasNext().should.equal(false)
	it 'should be able to delimit on a function symbol', ->
		t =tokeniser.createTokeniser('123+')
		t.next()
		t.hasNext().should.equal(true)
		t.next().should.equal('+')
