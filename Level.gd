extends Node

onready var old_player_pos = $Player.position

var bottle_timer = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	#updates map
	if int(old_player_pos.x / $TileMap.cell_size.x) < int($Player.position.x / $TileMap.cell_size.x):
		$TileMap.set_next_tile(1)
		$bg.position.x += $TileMap.cell_size.x
	if int(old_player_pos.x / $TileMap.cell_size.x) > int($Player.position.x / $TileMap.cell_size.x):
		$TileMap.set_next_tile(-1)
		$bg.position.x -= $TileMap.cell_size.x
	old_player_pos = $Player.position
	spawn_bottle(delta)


func spawn_bottle(delta):
	bottle_timer += delta
	# TODO timer aendern
	if bottle_timer >= 5:
		# RNG
		var r = randi() % 5
		# TODO Wahrscheinlichkeitsverteilung aendern
		# spawn bottle
		var bottle_scene
		var bottle_texture
		match r:
			0: # spawn Glass
				bottle_scene = "res://Glass.tscn"
				bottle_texture = "res://assets/bottles/glass.png"
			1: # spawn Bottle 1
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle1.png"
			2: # spawn Bottle 2
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle2.png"
			3: # spawn Bottle 3
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/bottle3.png"
			4: # spawn Bottle 4
				bottle_scene = "res://Bottle.tscn"
				bottle_texture = "res://assets/bottles/poison_bottle.png"
		var scene = load(bottle_scene)
		var scene_instance = scene.instance()
		scene_instance.set_name("Bottle")
		scene_instance.get_node("Texture").texture = load(bottle_texture)
		scene_instance.position = $Player.position + Vector2(1000,10)
		add_child(scene_instance)
		bottle_timer = 0