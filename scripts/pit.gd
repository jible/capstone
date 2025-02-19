extends Area2D

var next_scene = "res://scenes/testScenes/main_menu.tscn"

func _on_body_entered(body):
	print("player but body")
	if body.is_in_group("Player"):
		Globals.change_scene(load(next_scene))
