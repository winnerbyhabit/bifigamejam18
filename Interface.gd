extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Punkte/Counter.text = str(global.points)

func add_points(points):
	global.points += points
	$Punkte/Counter.text = str(global.points)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
