extends Label

signal restart

var credits= [
"Chief Programmer - \nChristoph Heinen",
"Creative Director - \nZbigniew Wojciechowski",
"Physics & Effects - \nNicolas Schmitt",
"Sound Designer - \nChristoph Heinen",
"Art Designer - \nZbigniew Wojciechowski",
"With special thanks to: \nOpenGameArt.org"
]
var counter=0

func next_credit():
	if(counter<credits.size()):
		text = credits[counter]
		counter+=1
	else:
		get_tree().quit()