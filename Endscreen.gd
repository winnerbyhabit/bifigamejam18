extends Control

signal restart

func _ready():
	$"Game Over/Label".text="points: "+str(global.points)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



func _on_restart_pressed():
	emit_signal("restart")


func _on_quit_pressed():
	get_tree().change_scene("res://Credits.tscn")
