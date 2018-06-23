extends TileMap

#gibt die ebene an auf der tiles generiert werden
export(Vector2) var tile_coordinates = Vector2(0,0)

#anzahl an tiles die am Anfang generiert werden
export var start_tiles = 5

#anzahl verschiedener tiles
export var number_of_tiles = 3
var last_coordinate #letztes tile rechts
var fist_coordinate #letztes tile links
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#muss vor rand funktionen aufgerufen werden
	randomize()	
	
	#setzt automatisch n küchen teile
	set_random_tile(tile_coordinates)
	for i in range(start_tiles-1):
		set_next_tile()

func set_random_tile(coordinate):
	
	var random_id = randi()%number_of_tiles
	set_cell(coordinate[0],coordinate.y,random_id)
	last_coordinate = coordinate

func set_next_tile(direction):
	if direction == 1:
		var coordinate = last_coordinate + Vector2(1,0)
		set_random_tile(coordinate)
	else:
		var coordinate = first - Vector2(1,0)
		set_random_tile(coordinate)