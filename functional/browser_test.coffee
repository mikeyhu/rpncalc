helper = require '../server/server.coffee'
Browser = require 'zombie'
assert = require 'assert'

describe 'visit', () ->
	before (done) ->
		this.browser = new Browser()
		this.browser.visit("http://localhost:3000/index.html").then(done, done)

	it 'should load the promises page', () ->
		assert.equal this.browser.success,true
		assert.ok this.browser.query("#inputNotation")
