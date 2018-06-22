extends TileMap

export(Vector2) var tile_coordinates = Vector2(0,0)
export var number_of_tiles = 3
var last_coordinate
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#muss vor rand funktionen aufgerufen werden
	randomize()	
	
	#setzt automatisch 6 küchen teile
	set_random_tile(tile_coordinates)
	for i in range(5):
		set_next_tile()

func set_random_tile(coordinate):
	
	var random_id = randi()%number_of_tiles
	set_cell(coordinate[0],coordinate.y,random_id)
	last_coordinate = coordinate

func set_next_tile():
	var coordinate = last_coordinate + Vector2(1,0)
	set_random_tile(coordinate)