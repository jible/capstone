extends Area2D

var usable = false

func turn_on():
	usable = true

func _on_body_entered(body):
	if body.is_in_group("Player") && usable:
		SignalBus.level_completed.emit()
		LevelManager.go_next_level()
