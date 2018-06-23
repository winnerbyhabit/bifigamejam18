extends "res://Level.gd"

signal change_level

#gibt die koordinaten der begrenzungen an
export(Vector2) var level_boundarys = Vector2(-5,5)
export var hidden_wall_id = 4
func _ready():
	#_ready von Level.gd wird automatisch aufgerufen
	set_boundarys(level_boundarys)
	initial_spawn_bottle() # spawn bottles a second time to get more bottles


func set_boundarys(boundarys):
	var y_coord = $TileMap.tile_coordinates.y 
	
	#hidden wall cat
	$TileMap.set_cell(boundarys.x,y_coord-1,2)
	$TileMap.set_cell(boundarys.y,y_coord-1,2)
	$TileMap.set_cell(boundarys.x,y_coord,2)
	$TileMap.set_cell(boundarys.y,y_coord,2)
	#hidden wall dog
	$TileMap.set_cell(boundarys.x,y_coord+1,2)
	$TileMap.set_cell(boundarys.y,y_coord+1,2)


func _on_enemy_killed():
	print('enenmy killed')
	emit_signal('change_level')
	