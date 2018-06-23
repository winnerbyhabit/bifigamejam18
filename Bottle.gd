extends RigidBody2D

signal destroy

export var points = 5

var destroy_height = 500

func _process(delta):
	if position.y > destroy_height:
		destroy()


func set_destroy_height(height):
	destroy_height = height

func kick():
	set_collision_mask_bit(0,false)
	return points
	
func destroy():
	emit_signal("destroy")
	$particles.emitting = true
	mode = MODE_STATIC
	$Texture.hide()
	if $Timer.is_stopped():
		$Timer.start()
	

func _on_Timer_timeout():
	queue_free()#print('timeout')


func _on_Bottle_body_entered( body ):
	if body.is_in_group('enemy'):
		destroy()
