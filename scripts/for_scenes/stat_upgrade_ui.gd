extends Control


@export var speaker: AudioStreamPlayer

func _ready() -> void:
	SignalBus.upgrade_success.connect(play_upgrade_success)
	SignalBus.upgrade_fail.connect(play_upgrade_fail)
	
func play_upgrade_success():
	SoundManager.play_ui_sound(speaker, SoundManager.UISounds.UPG_SUCCESS)
	
func play_upgrade_fail():
	SoundManager.play_ui_sound(speaker, SoundManager.UISounds.UPG_FAIL)
