extends Control

@export var previous_menu: Control
@onready var remap_button: Button = $"VBoxContainer/RemapButton"
@onready var language_dropdown: OptionButton = $"VBoxContainer/LanguageDropdown"

func _on_back_button_pressed() -> void:
	self.hide()
	previous_menu.show()

func _on_draw() -> void:
	remap_button.grab_focus()

func _on_language_dropdown_item_selected(index: int) -> void:
	#var language = language_dropdown.get_item_text(index)
	match index:
		0:
			#set to english
			pass
		1:
			#set to spanish
			pass
		2:
			#set to french
			pass
		_:
			#default case for errors, do nothing
			pass
