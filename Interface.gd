extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	add_points(0)
	add_lives(0)

func add_points(points):
	global.points += points
	$Punkte/Counter.text = str(global.points)

func add_lives(lifes):
	global.lifes += lifes
	$Punkte/Counter.text = str(global.points)