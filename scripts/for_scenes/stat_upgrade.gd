extends HBoxContainer

@export var stat_name: String

@onready var upgrade_level_label = $"UpgradeLevelLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label: Label = $"StatNameLabel"
	label.text = "Upgrade: " + stat_name
	SignalBus.player_stats_updated.connect(update_level_label)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)
	
#this function runs after UpgradeManager has updated
func update_level_label():
	upgrade_level_label.text = "Lvl. %d" %Callable(UpgradeManager, "get_%s_lvl" %stat_name).call()
