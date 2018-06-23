extends Node2D

#Geschwindigkeit


export var speed = 40

#katze bewegt sich automatisch
export var automove = true

var direction = 1
var tile_size = 64

var bottle_collision = false
var colliding_bottle = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("player is ready")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if automove:
		move(delta)
	else:
		if Input.is_action_pressed("player_right"):
			direction = 1

			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("player_left"):
			direction = -1
			$AnimatedSprite.flip_h = true
			
		move(delta)


	if Input.is_action_pressed("player_hit"):
		if bottle_collision:
			if not $meow.playing:
				$meow.play()
			colliding_bottle.kick()
			bottle_collision = false
		else:
			
			if not $meow.playing and not $meow_wrong.playing:
				$meow_wrong.play()
			

func move(delta):
	position.x += speed*delta*direction


func _on_wall_collision( body ):
	if body.is_in_group("wall"):
		#turn on wall collision
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	elif body.is_in_group("bottle"):
		bottle_collision = true
		colliding_bottle = body



func _on_body_exited( body ):
	if body.is_in_group("bottle"):
		bottle_collision = false
		colliding_bottle = null
