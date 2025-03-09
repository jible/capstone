extends Control

# Accreditation
# For how to use the TranslationServer functions
# https://docs.godotengine.org/en/stable/classes/class_translationserver.html#class-translationserver

@onready var remap_button: Button = $"VBoxContainer/RemapButton"
@onready var language_dropdown: OptionButton = $"VBoxContainer/LanguageDropdown"
@onready var filter_dropdown: OptionButton = $"VBoxContainer/FilterDropdown"

func _enter_tree() -> void:
	self.show()

func _on_draw() -> void:
	remap_button.grab_focus()
	#set_selected_language()
	filter_dropdown.selected = ShaderManager.current_material_index
	
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
	# TODO save just the options instead of the whole game
	SaveHandler.save_game()

# Changing the material order of the dropdown has to be reflected in the ShaderManager
func _on_filter_dropdown_item_selected(index: int) -> void:
	ShaderManager.change_material(index)
	SaveHandler.save_game()
	

func _on_back_button_pressed() -> void:
	SignalBus.options_closed.emit()
	self.queue_free()
	#emit signal

func set_selected_language():
	var select = 0
	print(TranslationServer.get_locale())
	match TranslationServer.get_locale():
		'en':
			select = 0
		'las':
			select = 1
		'fr':
			select = 2
		'ja':
			select = 3
		_: select = 0
	language_dropdown.selected = select
