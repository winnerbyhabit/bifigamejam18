extends "res://Level.gd"

#gibt die koordinaten der begrenzungen an
export(Vector2) var level_boundarys = Vector2(-5,5)
export var hidden_wall_id = 4
func _ready():
	#_ready von Level.gd wird automatisch aufgerufen
	
	set_boundarys(level_boundarys)
	
	pass

func set_boundarys(boundarys):
	var y_coord = $TileMap.tile_coordinates.y -1
	
	#hidden wall cat
	$TileMap.set_cell(boundarys.x,y_coord,3)
	$TileMap.set_cell(boundarys.y,y_coord,3)
	
	#hidden wall dog
	$TileMap.set_cell(boundarys.x,y_coord+2,2)
	$TileMap.set_cell(boundarys.y,y_coord+2,2)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
