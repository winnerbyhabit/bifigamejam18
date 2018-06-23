extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var current_level = -1
var level = null

func _ready():
	load_level(current_level)
	#change_level()
	

func change_level():
	current_level += 1
	if has_node('Level'):
		print('has node')
		var my_level = get_node('Level')
		call_deferred("remove_child",my_level)
		my_level.queue_free()
	else:
		print('has no node')
	load_level(current_level)

	
func load_level(level_number):
	print('loadlevel')
	if level_number % 2 == 0:
		level = preload('res://BossLevel.tscn').instance()
	else:
		level = preload('res://Level.tscn').instance()
	level.set_name("Level")
	add_child(level)
	#level.connect('change_level',self,'change_level')
	level.connect('game_over',self,'_on_gameover')

func _on_gameover():
	print('gameäover')
	current_level = 1
	if has_node('Level'):
		var my_level = get_node('Level')
		call_deferred("remove_child",my_level)
		my_level.queue_free()
	level = preload('res://Credits.tscn').instance()
	level.set_name("Level")
	add_child(level)
	level.connect('restart',self,'change_level')

