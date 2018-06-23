extends Node

onready var old_player_pos = $Player.position

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
