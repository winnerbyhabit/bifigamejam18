extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Button_pressed():
	print("Hello")
	get_tree().change_scene("res://Level.tscn")
	# http://docs.godotengine.org/en/latest/getting_started/step_by_step/scene_tree.html#changing-current-scene
	# TODO background loading
	# http://docs.godotengine.org/en/latest/tutorials/io/background_loading.html


# exit program
func _on_Button2_pressed():
	get_tree().quit()