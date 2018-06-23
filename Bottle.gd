extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Initialization here
	pass

func kick():
	print('kick')
	print(collision_mask)
	set_collision_mask_bit(0,false)

	#set_collision_mask_bit(4,true)
	print(collision_mask)
	#set_collision_mask_bit(1,true)
	#set_collision_layer_bit(1,false)
