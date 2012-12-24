helper = require '../server/server.coffee'
Browser = require 'zombie'
should = require 'should'

url = "http://localhost:3000/index.html"

describe 'Requesting the index', () ->
	before (done) ->
		@browser = new Browser()
		@browser.visit(url).then(done, done)

	it 'should load the index page', (done) ->
		@browser.success.should.equal true
		should.exist this.browser.query("#inputText")
		done()

describe 'Inputting some functions', () ->
	before (done) ->
		@browser = new Browser()
		@browser.visit(url).then(done, done)

	it 'should get an answer', (done) ->
		@browser.success.should.equal true
		@browser.fill("inputText","1 2+")
		@browser.field("#inputText").value.should.equal("1 2+")
		@browser.pressButton "calculate", () =>
			@browser.text("#outputArea").should.equal("$$1+2 = 3$$")
			done()

	it 'should be able to continue to get answers', (done) ->
		@browser.success.should.equal true
		@browser.fill("inputText","5 3 -")
		@browser.pressButton "calculate", () =>
			@browser.field("#inputText").value.should.equal("")
			@browser.text("#outputArea").should.equal("$$5-3 = 2$$")
			done()





