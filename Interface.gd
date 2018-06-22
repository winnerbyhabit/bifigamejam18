extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_points(10)
	pass

func add_points(points):
	$Punkte/Counter.text = str(int($Punkte/Counter.text) + points)
	 

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
