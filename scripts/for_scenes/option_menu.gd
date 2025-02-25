extends Control

@export var pause_menu: Control

func _on_back_button_pressed() -> void:
	self.hide()
	pause_menu.show()
