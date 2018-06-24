extends Node

export var heart_size = 32

signal game_over
signal game_won

var t = Timer.new()

func _ready():
	add_points(0)
	add_lifes(0)
	set_max_lifes($lifes/lifebar.max_value)
	if global.cat_scratches >= 1: # show cat
		t.set_wait_time(3)
		t.set_one_shot(true)
		get_node("Claw").show()
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		get_node("Cat").hide()
		get_node("Claw").show()
		match global.cat_scratches:
			1:
				get_node("Claw").texture = load("res://assets/claws/claw1.png")
			2:
				get_node("Claw").texture = load("res://assets/claws/claw2.png")
			3:
				get_node("Claw").texture = load("res://assets/claws/claw3.png")
			4:
				get_node("Claw").texture = load("res://assets/claws/claw4.png")

func add_points(points):
	global.points += points
	$Punkte/Counter.text = str(global.points) + '/' + str(global.points_to_next_level)
	if global.points >= global.points_to_next_level:
		emit_signal('game_won')

func add_lifes(lifes, force_add = true):
	# force_add: gib Leben ohne Limit
	if force_add or global.lifes < $lifes/lifebar.max_value:
		global.lifes += lifes
	$lifes/lifebar.value = global.lifes
	if global.lifes <= 0:
		emit_signal('game_over')
	
func set_max_lifes(max_lifes):

	$lifes/lifebar.max_value=max_lifes
	$lifes/lifebar.rect_size.x = heart_size*max_lifes
	$lifes/lifebar.value = global.lifes