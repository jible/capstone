extends Control

# Accreditation
# For how to use the TranslationServer functions
# https://docs.godotengine.org/en/stable/classes/class_translationserver.html#class-translationserver

@onready var remap_button: Button = $"VBoxContainer/RemapButton"
@onready var language_dropdown: OptionButton = $"VBoxContainer/LanguageDropdown"
	
func _enter_tree() -> void:
	self.show()

func _on_draw() -> void:
	remap_button.grab_focus()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		_on_back_button_pressed()

func _on_language_dropdown_item_selected(index: int) -> void:
	#var language = language_dropdown.get_item_text(index)
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
		_:
			#default case for errors, do nothing
			pass
	SignalBus.update_HUD.emit()

# Changing the material order of the dropdown has to be reflected in the ShaderManager
func _on_filter_dropdown_item_selected(index: int) -> void:
	ShaderManager.change_material(index)

func _on_back_button_pressed() -> void:
	SignalBus.options_closed.emit()
	self.queue_free()
