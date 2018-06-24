extends Node

signal change_level
signal game_over

onready var old_player_pos = $Player.position

export var bottom_height = 500


# initialize variables; do not change
var bottle_timer = 0
var bottle_space = 1


export var bottle_frequency = 2.0
# change this value to set distance between bottles
# higher frequency == more bottles


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	initial_spawn_bottle()


func _process(delta):
	#updates map
	if int(old_player_pos.x / $TileMap.cell_size.x) < int($Player.position.x / $TileMap.cell_size.x):
		$TileMap.set_next_tile(1)
		$bg.position.x += $TileMap.cell_size.x
		$bg_floor.position.x += $TileMap.cell_size.x
	if int(old_player_pos.x / $TileMap.cell_size.x) > int($Player.position.x / $TileMap.cell_size.x):
		$TileMap.set_next_tile(-1)
		$bg.position.x -= $TileMap.cell_size.x
		$bg_floor.position.x -= $TileMap.cell_size.x
	old_player_pos = $Player.position
	loop_spawn_bottle(delta)


func random_distance():
	return rand_range(0.5, 1.0 + (5.0 / bottle_frequency))


func spawn_single_bottle(pos):
	# RNG
	var r = randi() % 6
	bottle_space = random_distance()
	# spawn bottle
	var bottle_scene
	var bottle_texture
	var bottle_type
	var bottle_is_poison = false
	if (0 <= r) and (r <= 4):
		match r:
			0: # spawn Glass
				bottle_scene = "res://Glass.tscn"
				bottle_texture = "res://assets/bottles/glass.png"
				bottle_type = "Normal"
			1: # spawn Bottle 1
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle1.png"
				bottle_type = "Normal"
			2: # spawn Bottle 2
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle2.png"
				bottle_type = "Normal"
			3: # spawn Bottle 3
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle3.png"
				bottle_type = "Normal"
			4: # spawn Poison bottle
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/poison_bottle.png"
				bottle_type = "Poison"
				bottle_is_poison = true
		var scene = load(bottle_scene)
		var bottle = scene.instance()
		bottle.set_name(bottle_type)
		bottle.get_node("Texture").texture = load(bottle_texture)
		bottle.set_destroy_height(bottom_height)
		bottle.position = pos
		bottle.is_poison = bottle_is_poison
		add_child(bottle)
		bottle_timer = 0
	if r == 5: # spawn Fishbowl
		bottle_scene = "res://Fishbowl.tscn"
		bottle_type = "Fish"
		var scene = load(bottle_scene)
		var bottle = scene.instance()
		bottle.set_name(bottle_type)
		# bottle.set_destroy_height(bottom_height)
		bottle.position = pos
		add_child(bottle)
		bottle_timer = 0
func reset_life():
	global.lifes = $Player.lifes

func loop_spawn_bottle(delta):
	bottle_timer += delta
	if bottle_timer >= bottle_space:
		spawn_single_bottle($Player.position + Vector2(1000,0))

func initial_spawn_bottle():
	print("initial spawn bottles")
	print($Player.position)
	var m = $Player.position.x + 1000
	var i = -m
	while i <= m:
		spawn_single_bottle($Player.position + Vector2(i,0))
		i += int (120.0 * random_distance())

func _on_gameover():
	emit_signal('game_over')
