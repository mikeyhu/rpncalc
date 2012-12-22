$(document).ready () ->
	$("#calculate").on "click", calculate
	$("#inputText").pressEnter calculate

calculate = () ->
	c = calculator.createCalculator()
	inData = $("#inputText").attr("value")
	$("#inputText").attr("value","")
	c.parse(inData)
	$("#outputArea").text("$$" + c.display() + " = " + c.answer() + "$$")
	MathJax.Hub.Queue(["Typeset",MathJax.Hub,"outputArea"])	

$.fn.pressEnter = (fn) ->
	@each () ->
		$(@).bind('enterPress', fn)
		$(@).keyup (e) ->
			if(e.keyCode == 13) then $(@).trigger("enterPress")
