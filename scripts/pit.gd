extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		SignalBus.level_completed.emit()
		LevelManager.go_next_level()
