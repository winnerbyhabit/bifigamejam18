extends RigidBody2D

signal destroy

var destroy_height = 500

func _process(delta):
	if position.y > destroy_height:
		emit_signal("destroy")
		queue_free()

func set_destroy_height(height):
	destroy_height = height

func kick():
	set_collision_mask_bit(0,false)
	