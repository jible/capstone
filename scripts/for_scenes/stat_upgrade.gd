extends HBoxContainer

@export var stat_name: String
@export var upgrade_icon : CompressedTexture2D
@onready var stat_name_label = $"StatNameLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect.texture = upgrade_icon
	stat_name_label.text = tr("UPGRADE_LABEL") + stat_name
	

#this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)
