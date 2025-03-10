extends Area2D

@export var locked_sprite : Sprite2D
@export var unlocked_sprite : AnimatedSprite2D

var usable = false

func _ready():
	unlocked_sprite.visible = false
	locked_sprite.visible = true

func turn_on():
	usable = true
	locked_sprite.visible = false
	unlocked_sprite.visible = true

func _on_body_entered(body):
	if body.is_in_group("Player") && usable:
		SignalBus.level_completed.emit()
		LevelManager.go_next_level()
