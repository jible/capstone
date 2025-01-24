extends HBoxContainer

@export var stat_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##this function runs when the upgrade button is pressed
func _on_stat_increased() -> void:
	SignalBus.upgrade_stat_button_pressed.emit(stat_name)
