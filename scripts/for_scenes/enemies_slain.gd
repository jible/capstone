extends Control

@onready var header_label: Label = %HeaderLabel
@onready var count_label: Label = %CountLabel

var required_enemies: int = LevelManager.get_current_package().enemy_package.required_enemies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_count_label(0)
	SignalBus.connect("enemy_killed", update_count_label)
	SignalBus.connect("required_enemies_killed", update_header_label)

func update_count_label(count: int):
	count_label.text = "%d / %d" % [count, required_enemies]

func update_header_label():
	count_label.text = tr("EXIT_UNLOCKED")
