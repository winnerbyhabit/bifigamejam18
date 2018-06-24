extends Node

signal restart

func on_restart():
	$anim.stop()
	emit_signal('restart')