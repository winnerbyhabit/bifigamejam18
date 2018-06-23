extends Area2D

export var speed = 100
export var lifepoints = 3

signal enemy_killed

var direction = -1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	move(delta)
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func move(delta):
	position.x += speed*delta*direction
	
func _on_enemy_wall_collision( body ):
	if body.is_in_group("wall"):
		#turn on wall collision
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
	elif body.is_in_group('bottle'):
		lifepoints -= 1
		if lifepoints <= 0:
			kill_enemy()
			
func kill_enemy():
	emit_signal('enemy_killed')