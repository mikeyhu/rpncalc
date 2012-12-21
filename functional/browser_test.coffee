helper = require '../server/server.coffee'
Browser = require 'zombie'
assert = require 'assert'

describe 'Requesting the index', () ->
	before (done) ->
		this.browser = new Browser()
		this.browser
		.visit("http://localhost:3000/index.html")
		.then(done, done)

	it 'should load the index page', (done) ->
		assert.equal this.browser.success,true
		assert.ok this.browser.query("#inputText")
		done()

describe 'Inputting some functions', () ->
	before (done) ->
		this.browser = new Browser()
		this.browser
		.visit("http://localhost:3000/index.html")
		.then(done, done)

	it 'should get an answer', (done) ->
		assert.equal this.browser.success,true
		this.browser.fill("inputText","1 2+")
		assert.equal(this.browser.field("#inputText").value,"1 2+")
		this.browser.pressButton "calculate", () =>
			assert.equal(this.browser.text("#outputArea"),"$$1+2 = 3$$")
			done()

	it 'should be able to continue to get answers', (done) ->
		assert.equal this.browser.success,true
		this.browser.fill("inputText","5 3 -")
		this.browser.pressButton "calculate", () =>
			assert.equal(this.browser.field("#inputText").value,"")
			assert.equal(this.browser.text("#outputArea"),"$$5-3 = 2$$")
			done()





