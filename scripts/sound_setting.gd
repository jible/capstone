extends Node2D
class_name SoundSetting

var volume_db : float = 0.0
var pitch_scale : float = 1.0
var attenuation : float = 1.0

func _init(vol : float, pitch : float, att : float) -> void:
	volume_db = vol
	pitch_scale = pitch
	attenuation = att
