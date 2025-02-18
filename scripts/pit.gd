extends Area2D

var next_scene = "res://scenes/testScenes/main_menu.tscn"

func _on_body_entered(body):
	print("player but body")
	Globals.change_scene(load(next_scene))
