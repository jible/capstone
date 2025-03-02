extends Control

@export var stat: String

@onready var bonus_label: Label = $"BonusLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_bonus_label()
	#link to signal to update
	SignalBus.update_HUD.connect(update_bonus_label)

func update_bonus_label() -> void:
	bonus_label.text = "BONUS: + %.1f" % UpgradeManager.get_stat(stat)
