extends RigidBody2D

signal destroy

export var points = 5

var destroy_height = 500

var will_destroyed = false

func _process(delta):
	if position.y > destroy_height:
		if not will_destroyed:
			destroy()


func set_destroy_height(height):
	destroy_height = height

func kick():
	set_collision_mask_bit(0,false)
	return points
	
func destroy():
	will_destroyed = true
	#emit_signal("destroy")
	$particles.emitting = true
	mode = MODE_STATIC
	$Texture.hide()
	if not $Destroy.playing:
		$Destroy.play()


func test():
	queue_free()
	#pass # replace with function body
