$(document).ready () ->
	$("#submit").on "click", () ->
		c = calculator.createCalculator()
		inData = $("#inputNotation").attr("value")
		$("#outputNotation").text(inData + " = " + c.parse(inData))	



