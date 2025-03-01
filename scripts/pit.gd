extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		LevelManager.go_next_level()
