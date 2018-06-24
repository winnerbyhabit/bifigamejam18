extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var current_level = 1
var level = null
var remove_level=false
var game_over = false
var level_restart = false


func _ready():
	load_level(current_level)
	#change_level()

func _process(delta):
	if remove_level or game_over or level_restart:
		change_level()
	if level_restart:
		level.reset_life()
		level_restart = false

func _on_change_level():
	remove_level = true

func change_level():
	current_level += 1
	if has_node('Level'):
		var my_level = get_node('Level')
		remove_child(my_level)
		my_level.queue_free()
		cat_closeup()
	load_level(current_level)

	
func load_level(level_number):
	global.points_to_next_level = get_points_to_next_level()
	global.player_speed_multiplicator = get_player_speed_in_next_level()
	print('loadlevel')
	if game_over:
		level = preload('res://Endscreen.tscn').instance()
	elif level_number % 2 == 0:
		level = preload('res://BossLevel.tscn').instance()
	else:
		level = preload('res://Level.tscn').instance()
	level.set_name("Level")
	add_child(level)
	if game_over:
		level.connect('restart',self,'restart')
		game_over = false
	else:
		level.connect('game_over',self,'_on_gameover')
		level.connect('change_level',self,'_on_change_level')
	remove_level = false
	

func restart():
	current_level = 0
	global.points = 0
	global.points_to_next_level = get_points_to_next_level()
	global.player_speed_multiplicator = get_player_speed_in_next_level()
	level_restart = true
	level = null

func get_points_to_next_level():
	return current_level*50 + 10

func get_player_speed_in_next_level():
	return current_level*0.3+1

func _on_gameover():
	print('game_gameover')
	game_over = true
	current_level = 1

func cat_closeup():
	# load cat scene
	global.cat_scratches += 1