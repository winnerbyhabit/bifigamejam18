extends "res://Level.gd"

#gibt die koordinaten der begrenzungen an
export(Vector2) var level_boundarys = Vector2(-5,5)

func _ready():
	#_ready von Level.gd wird automatisch aufgerufen
	
	set_boundarys(level_boundarys)
	
	pass

func set_boundarys(boundarys):
	var y_coord = $TileMap.tile_coordinates.y -1
	$TileMap.set_random_tile(Vector2(boundarys.x,y_coord))
	$TileMap.set_random_tile(Vector2(boundarys.y,y_coord))
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
