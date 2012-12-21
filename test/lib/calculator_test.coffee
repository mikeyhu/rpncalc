require 'should'
assert = require 'assert'
calc = require '../../lib/calculator.coffee'


describe 'An rpn calculator', ->
	it 'should be able to have an item added to a stack', ->
		c = calc.createCalculator()
		c.push(1)
		assert.deepEqual(c.stack(),[1])
	it 'should be able add two numbers on the stack and replace those numbers with the result', ->
		c = calc.createCalculator()
		c.push(3)
		c.push(5)
		c.input('+')
		assert.deepEqual(c.stack(),[8])
	it 'should be able add multiple numbers by using the stack', ->
		c = calc.createCalculator()
		c.push(3)
		c.push(5)
		c.push(2)
		c.input('+').should.equal(7)
		c.input('+').should.equal(10)
		assert.deepEqual(c.stack(),[10])
	it 'should be able to minus two numbers', ->
		c = calc.createCalculator()
		c.push(3)
		c.push(5)
		c.input('-').should.equal(-2)
	it 'should be able to multiply two numbers', ->
		c = calc.createCalculator()
		c.push(3)
		c.push(5)
		c.input('*').should.equal(15)
	it 'should be able to divide two numbers', ->
		c = calc.createCalculator()
		c.push(6)
		c.push(2)
		c.input('/').should.equal(3)
	it 'should be able to divide two numbers to produce a non integer number', ->
		c = calc.createCalculator()
		c.push(5)
		c.push(2)
		c.input('/').should.equal(2.5)
	it 'should be able to parse a + into an add', ->
		c = calc.createCalculator()
		c.push(5)
		c.push(2)
		c.input("+").should.equal(7)
	it 'should be able to parse a - into an minus', ->
		c = calc.createCalculator()
		c.push(5)
		c.push(2)
		c.input("-").should.equal(3)
	it 'should be able to parse a / into an divide', ->
		c = calc.createCalculator()
		c.push(5)
		c.push(2)
		c.input("/").should.equal(2.5)
	it 'should be able to parse a * into an multiply', ->
		c = calc.createCalculator()
		c.push(5)
		c.push(2)
		c.input("*").should.equal(10)
	it 'should be able to parse a string of numbers', ->
		c = calc.createCalculator()
		c.parse("3 2")
		assert.deepEqual(c.stack(),[2,3])
	it 'should be able to parse a string of numbers and functions', ->
		c = calc.createCalculator()
		c.parse("3 2 +").should.equal(5)
	it 'should be able to parse a larger string of numbers and functions', ->
		c = calc.createCalculator()
		c.parse("7 3 2 + *").should.equal(35)
		assert.deepEqual(c.stack(),[35])
	it 'should be able to parse a string of numbers and functions without spaces using the answer', ->
		c = calc.createCalculator()
		c.parse("7 3+")
		c.answer().should.equal(10)
	it 'should be able to parse a string of numbers and functions including the /', ->
		c = calc.createCalculator()
		c.parse("8 4/").should.equal(2)
	it 'should be able to convert a set of inputs into braceted algebra', ->
		c = calc.createCalculator()
		c.parse("7 3 +")
		assert.deepEqual(c.display(),"7+3")
	it 'should be able to convert a token into a algebraic string', ->
		c = calc.createCalculator()
		c.push(3)
		c.push(4)
		c.parse("+")
		c.display().should.equal("3+4")
	it 'should be able to convert a single input into a single output', ->
		c = calc.createCalculator()
		c.parse("5")
		c.display().should.equal("5")
	it 'should be able to convert a more complex input with multiple functions into a single output', ->
		c = calc.createCalculator()
		c.parse("4 5* 3+")
		c.display().should.equal("4\\times5+3")
	it 'should be able to convert a more complex input with multiple functions into a single output (different functions)', ->
		c = calc.createCalculator()
		c.parse("4 5/ 72 4/ *")
		c.display().should.equal("\\frac{4}{5}\\times\\frac{72}{4}")
	

	
