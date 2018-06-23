extends TileMap

#gibt die ebene an auf der tiles generiert werden
export(Vector2) var tile_coordinates = Vector2(0,0)

#anzahl an tiles die am Anfang generiert werden
export var start_tiles = 5

#anzahl verschiedener tiles
export var number_of_tiles = 3
onready var last_coordinate = tile_coordinates #letztes tile rechts
onready var first_coordinate = tile_coordinates#letztes tile links
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#muss vor rand funktionen aufgerufen werden
	randomize()	
	
	#setzt automatisch n küchen teile
	set_random_tile(tile_coordinates)
	for i in range(start_tiles-1):
		set_next_tile(1)

func set_random_tile(coordinate):
	
	var random_id = randi()%number_of_tiles
	set_cell(coordinate[0],coordinate.y,random_id)


func set_next_tile(direction):
	if direction == 1:
		var coordinate = Vector2(last_coordinate.x +1,tile_coordinates.y)
		set_random_tile(coordinate)
		last_coordinate = coordinate
	else:
		var coordinate = Vector2(first_coordinate.x -1,tile_coordinates.y)
		set_random_tile(coordinate)
		first_coordinate = coordinate