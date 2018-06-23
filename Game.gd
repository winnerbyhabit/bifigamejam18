extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var current_level = -1
var level = null

func _ready():
	change_level()
	pass
func change_level():
	current_level += 1

	var level = get_node('Level')
	remove_child(level)
	load_level(current_level)

	
func load_level(level):
	if level % 2 == 0:
		level = preload('res://BossLevel.tscn').instance()
		level.set_name("Level")
		add_child(level)
		level.connect('change_level',self,'change_level')
	else:
		level = preload('res://Level.tscn').instance()
		level.set_name("Level")
		add_child(level)
		level.connect('change_level',self,'change_level')
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
