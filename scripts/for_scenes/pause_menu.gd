extends Control

@export var option_menu: PackedScene
@export var speaker : AudioStreamPlayer

@onready var option_toggle: Button = %OptionsToggle

var sfx = SoundManager

func _ready() -> void:
	SignalBus.options_closed.connect(_on_options_hidden)
	visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		visible = !visible
		get_tree().paused = !get_tree().paused
		sfx.play_ui_sound(speaker,sfx.UISounds.PAUSE)
		if !get_tree().paused:
			SignalBus.game_resumed.emit()
			sfx.play_ui_sound(speaker,sfx.UISounds.UNPAUSE)


func _on_options_toggle_pressed() -> void:
	self.hide()
	var options_instance = option_menu.instantiate()
	get_parent().add_child(options_instance)

func _on_resume_toggle_pressed() -> void:
	#resume game, hide pause menu
	get_tree().paused = false
	self.hide()
	SignalBus.game_resumed.emit()
	sfx.play_ui_sound(speaker,sfx.UISounds.UNPAUSE)

func _on_quit_toggle_pressed() -> void:
	Globals.quit_game()

func _on_draw() -> void:
	option_toggle.grab_focus()
	
func _on_options_hidden():
	self.show()
