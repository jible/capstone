extends Control

@onready var pause_menu: Control = $"PauseMenu"
@onready var option_menu: Control = $"OptionMenu"
@onready var option_toggle: Button = $"PauseMenu/VBoxContainer/OptionsToggle"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if !pause_menu.visible && option_menu.visible:
			option_menu.hide()
			pause_menu.show()
		else:
			visible = !visible
			get_tree().paused = !get_tree().paused
			SignalBus.game_resumed.emit()

func _on_options_toggle_pressed() -> void:
	pause_menu.hide()
	option_menu.show()

func _on_resume_toggle_pressed() -> void:
	#resume game, hide pause menu
	get_tree().paused = false
	self.hide()
	SignalBus.game_resumed.emit()

func _on_quit_toggle_pressed() -> void:
	Globals.quit_game()

func _on_pause_menu_draw() -> void:
	option_toggle.grab_focus()
