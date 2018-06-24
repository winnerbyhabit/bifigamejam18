extends Node

func _ready():
	$Player/Interface_Layer/Interface.hide()

func _on_Button_pressed():
	print("Hello")
	get_tree().change_scene("res://Game.tscn")
	# http://docs.godotengine.org/en/latest/getting_started/step_by_step/scene_tree.html#changing-current-scene
	# TODO background loading
	# http://docs.godotengine.org/en/latest/tutorials/io/background_loading.html


# exit program
func _on_Button2_pressed():
	get_tree().quit()
