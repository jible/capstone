extends Node2D

class_name Inventory
@export var speaker : AudioStreamPlayer2D
var sfx = SoundManager
var items = {}

func obtain_item(currency_type,amount):
	items[currency_type] =  items.get(currency_type, 0 ) + amount
	
func check_item(type):
	if type in items:
		return items[type]
	return 0

func _on_pick_up_item_collected(type, amount):
	sfx.play_player_sound(speaker,sfx.PlayerSounds.PICKUP)
	speaker.pitch_scale = randf_range(0.25,2)
	obtain_item(type, amount)
	SignalBus.currency_changed.emit()
