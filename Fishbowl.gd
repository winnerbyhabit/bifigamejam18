extends "res://Bottle.gd"

var used = false

func kick():
	if not used:
		$Texture.play('dead')
		is_fish = false
		return points