extends Control

@export var previous_menu: Control
@onready var remap_button: Button = $"VBoxContainer/RemapButton"

func _on_back_button_pressed() -> void:
	self.hide()
	previous_menu.show()

func _on_draw() -> void:
	remap_button.grab_focus()
