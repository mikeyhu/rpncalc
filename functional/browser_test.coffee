helper = require '../server/server.coffee'
Browser = require 'zombie'
assert = require 'assert'
should = require 'should'

url = "http://localhost:3000/index.html"

describe 'Requesting the index', () ->
	before (done) ->
		@browser = new Browser()
		@browser.visit(url).then(done, done)

	it 'should load the index page', (done) ->
		this.browser.success.should.equal(true)
		assert.ok this.browser.query("#inputText")
		done()

describe 'Inputting some functions', () ->
	before (done) ->
		@browser = new Browser()
		@browser.visit(url).then(done, done)

	it 'should get an answer', (done) ->
		assert.equal @browser.success,true
		@browser.fill("inputText","1 2+")
		@browser.field("#inputText").value.should.equal("1 2+")
		@browser.pressButton "calculate", () =>
			@browser.text("#outputArea").should.equal("$$1+2 = 3$$")
			done()

	it 'should be able to continue to get answers', (done) ->
		assert.equal @browser.success,true
		@browser.fill("inputText","5 3 -")
		@browser.pressButton "calculate", () =>
			@browser.field("#inputText").value.should.equal("")
			@browser.text("#outputArea").should.equal("$$5-3 = 2$$")
			done()





