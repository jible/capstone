extends HBoxContainer

@export var stat_name: String
@export var upgrade_icon : CompressedTexture2D
@onready var upgrade_level_label = $"UpgradeLevelLabel"
@onready var stat_name_label = $"StatNameLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect.texture = upgrade_icon
	stat_name_label.text = "UPGRADE: " + stat_name
	update_level_label()
	SignalBus.update_HUD.connect(update_level_label)

#this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)
	
#this function runs after UpgradeManager has updated
func update_level_label() -> void:
	upgrade_level_label.text = "Lvl. %d" %UpgradeManager.get_stat_lvl(stat_name)
