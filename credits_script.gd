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

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func next_credit():
	print("counter")
	if(counter<credits.size()):
		text = credits[counter]
		counter+=1
	else:
		emit_signal('restart')
		#get_tree().quit()