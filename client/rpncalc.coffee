$(document).ready () ->
	$("#submit").on "click", calculate
	$("#inputNotation").pressEnter calculate

calculate = () ->
	c = calculator.createCalculator()
	inData = $("#inputNotation").attr("value")
	$("#inputNotation").attr("value","")
	$("#outputNotation").text(inData + " = " + c.parse(inData))	

$.fn.pressEnter = (fn) ->
	this.each () ->
		$(this).bind('enterPress', fn)
		$(this).keyup (e) ->
			if(e.keyCode == 13) then $(this).trigger("enterPress")
