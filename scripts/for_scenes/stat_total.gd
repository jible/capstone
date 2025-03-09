extends Control

@export var stat: String

@onready var upgrade_level_label = %UpgradeLevelLabel
@onready var bonus_label: Label = %BonusLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_level_label()
	update_bonus_label()
	#link to signal to update
	SignalBus.update_HUD.connect(update_level_label)
	SignalBus.update_HUD.connect(update_bonus_label)

func update_level_label() -> void:
	upgrade_level_label.text = "Lvl. %d" % UpgradeManager.get_stat_lvl(stat)

func update_bonus_label() -> void:
	bonus_label.text = tr("BONUS") + "%.1f" % UpgradeManager.get_stat(stat)
