extends Area2D


func _on_body_entered(body):
	print("player but body")
	get_tree().reload_current_scene()
