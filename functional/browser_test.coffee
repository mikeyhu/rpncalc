helper = require '../server/server.coffee'
Browser = require 'zombie'
assert = require 'assert'

describe 'Requesting the index', () ->
	before (done) ->
		this.browser = new Browser()
		this.browser
		.visit("http://localhost:3000/index.html")
		.then(done, done)

	it 'should load the index page', () ->
		assert.equal this.browser.success,true
		assert.ok this.browser.query("#inputNotation")

describe 'Inputting some functions', () ->
	before (done) ->
		this.browser = new Browser()
		this.browser
		.visit("http://localhost:3000/index.html")
		.then(done, done)

	it 'should get an answer', () ->
		assert.equal this.browser.success,true
		this.browser.fill("inputNotation","1 2+")
		assert.equal(this.browser.field("#inputNotation").value,"1 2+")
		this.browser.pressButton "submit", () =>
			assert.equal(this.browser.text("#outputNotation"),"1 2+ = 3")

	it 'should be able to continue to get answers', () ->
		assert.equal this.browser.success,true
		this.browser.fill("inputNotation","5 3 -")
		this.browser.pressButton "submit", () =>
			assert.equal(this.browser.field("#inputNotation").value,"")
			assert.equal(this.browser.text("#outputNotation"),"5 3 - = 2")





