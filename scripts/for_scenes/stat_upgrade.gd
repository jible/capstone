extends HBoxContainer

@export var stat_name: String

@onready var upgrade_level_label = $"UpgradeLevelLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label: Label = $"StatNameLabel"
	label.text = "Upgrade: " + stat_name
	SignalBus.update_HUD.connect(update_level_label)

#this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)
	
#this function runs after UpgradeManager has updated
func update_level_label():
	upgrade_level_label.text = "Lvl. %d" %UpgradeManager.get_stat_lvl(stat_name)
