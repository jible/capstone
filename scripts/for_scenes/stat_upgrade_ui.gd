extends Control

@export var speaker: AudioStreamPlayer
@export var focus_button: Button

@export var book_texture : TextureRect
func _ready() -> void:
	SignalBus.upgrade_success.connect(play_upgrade_success)
	SignalBus.upgrade_fail.connect(play_upgrade_fail)
	SignalBus.game_resumed.connect(focus_ui)
	
func play_upgrade_success():
	SoundManager.play_ui_sound(speaker, SoundManager.UISounds.UPG_SUCCESS)
	
func play_upgrade_fail():
	SoundManager.play_ui_sound(speaker, SoundManager.UISounds.UPG_FAIL)
	ShaderManager.shake(book_texture,0.25)

func _on_draw() -> void:
	focus_ui()
	
func focus_ui():
	focus_button.grab_focus()
