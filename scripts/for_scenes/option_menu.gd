extends Control

@export var previous_menu: Control

func _on_back_button_pressed() -> void:
	self.hide()
	previous_menu.show()
