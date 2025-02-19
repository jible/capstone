extends Area2D
class_name PickUp

@export var speaker : AudioStreamPlayer2D
var sfx = SoundManager

func _on_area_entered(area : Collectable):
	collect(area.type, area.point_value)
	kill(area)

func collect(type, amount):
	sfx.play_player_sound(speaker,sfx.PlayerSounds.PICKUP)
	speaker.pitch_scale = randf_range(0.25,2)
	SignalBus.item_collected.emit(type, amount)

func kill(collect):
	collect.queue_free()
