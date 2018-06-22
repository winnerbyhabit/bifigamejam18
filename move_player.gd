extends Node2D

#Geschwindigkeit
export var speed = 0.1
var tile_size = 64

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("player is ready")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	move_right()
	if Input.is_action_pressed("player_hit"):
		print("pressed space")

func move_right():
	position.x += speed
