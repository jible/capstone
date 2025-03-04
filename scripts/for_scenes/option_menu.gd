extends Control

# Accreditation
# For how to use the TranslationServer functions
# https://docs.godotengine.org/en/stable/classes/class_translationserver.html#class-translationserver

@export var previous_menu: Control
@onready var remap_button: Button = $"VBoxContainer/RemapButton"
@onready var language_dropdown: OptionButton = $"VBoxContainer/LanguageDropdown"

func _on_back_button_pressed() -> void:
	self.hide()
	previous_menu.show()

func _on_draw() -> void:
	remap_button.grab_focus()

func _on_language_dropdown_item_selected(index: int) -> void:
	match index:
		0:
			TranslationServer.set_locale("en")
			pass
		1:
			TranslationServer.set_locale("las")
			pass
		2:
			TranslationServer.set_locale("fr")
			pass
		3: 
			TranslationServer.set_locale("ja")
		_:
			#default case for errors, do nothing
			pass

# Changing the material order of the dropdown has to be reflected in the ShaderManager
func _on_filter_dropdown_item_selected(index: int) -> void:
	ShaderManager.change_material(index)
