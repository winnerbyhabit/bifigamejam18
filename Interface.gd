extends Node

export var heart_size = 32

signal game_over

func _ready():
	add_points(0)
	add_lifes(0)
	set_max_lifes($lifes/lifebar.max_value)

func add_points(points):
	global.points += points
	$Punkte/Counter.text = str(global.points)

func add_lifes(lifes):
	printt('p:',global.lifes)
	global.lifes += lifes
	$lifes/lifebar.value = global.lifes
	if global.lifes <= 0:
		emit_signal('game_over')
	
func set_max_lifes(max_lifes):

	$lifes/lifebar.max_value=max_lifes
	$lifes/lifebar.rect_size.x = heart_size*max_lifes
	$lifes/lifebar.value = global.lifes