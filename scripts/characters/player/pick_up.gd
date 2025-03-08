extends Area2D
class_name PickUp

@export var speaker : AudioStreamPlayer2D
@export var character: CharacterBody2D
var sfx = SoundManager

func _on_area_entered(area : Collectible):
	collect_item(area)
	
func collect_item(area: Collectible):
	add_to_inventory(area.type, area.point_value)
	kill(area)

func add_to_inventory(type, amount):
	if type == "health":
		sfx.play_player_sound(speaker,SoundManager.PlayerSounds.HEAL)
		character.health_manager.receive_healing(amount)
		return
	
	sfx.play_player_sound(speaker,sfx.PlayerSounds.PICKUP)
	speaker.pitch_scale = randf_range(0.5,2)
	SignalBus.item_collected.emit(type, amount)

func kill(collect):
	collect.queue_free()
