extends HBoxContainer

@export var stat_name: String
@export var upgrade_icon : CompressedTexture2D
@onready var stat_name_label = $"StatNameLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect.texture = upgrade_icon
	update_stat_name_label_text()
	SignalBus.update_HUD.connect(update_stat_name_label_text)
	

#this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)

func update_stat_name_label_text():
	stat_name_label.text = tr("UPGRADE_LABEL") + tr(stat_name)
