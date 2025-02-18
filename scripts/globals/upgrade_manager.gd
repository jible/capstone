extends Node 

# upgradable stats
# hp and dmg are flat increases, starting at 0
# speed is a mult increase, should start at 1
# TODO
# delink level from stat increase
# start levels at 0,
# convert to indices of an upgrades array (source of truth)
var stat_lvl: Dictionary = {
	"health": 0,
	"dmg": 0,
	"speed": 1
}
#amount to increase upgrades by
var upgrade_growth: Dictionary = {
	"health": 1,
	"dmg": 1,
	"speed": 1.2
}
var upgrade_cost = 1

# Audio Player for UI sounds
var my_speaker: AudioStreamPlayer2D

##Death Scene
var death_scene: PackedScene = preload(
	"res://scenes/prefabs/ui_elements/death_screen.tscn")

#Inventory ref from player

func _ready(): 
	my_speaker = AudioStreamPlayer2D.new()
	add_child(my_speaker)
	##WHY WHY WHY
	SoundManager.play_ui_sound(my_speaker, SoundManager.UISounds.UPG_SUCCESS)
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)
	SignalBus.player_die.connect(_on_player_died)
	
func check_can_upgrade(stat: String) -> bool:
	if get_upgrade_cost(stat) <= Inventory.check_item(Globals.currency_key):
		return true
	return false

func upgrade_stat(stat: String):
	stat_lvl[stat] += 1
	
#TODO convert to use array indices from csv
func get_stat(stat: String):
	return stat_lvl[stat] * upgrade_growth[stat]

func get_stat_lvl(stat: String):
	return stat_lvl[stat]
	
#TODO convert to use array indices from csv
func get_upgrade_cost(stat: String):
	if get_stat_lvl(stat) == 0:
		return upgrade_cost
	else:
		return get_stat_lvl(stat) * upgrade_cost

func remove_currency(stat: String):
	Inventory.items[Globals.currency_key] -= get_upgrade_cost(stat)
	SignalBus.currency_changed.emit()

# Upgrades: 
# health in res://scripts/characters/player/player.gd
# dmg in res://scripts/characters/hitbox.gd
# speed in res://scripts/characters/mobility_manager.gd
# all linked to player_stats_updated signal
func _on_stat_upgraded(stat_name: String):
	SoundManager.play_ui_sound(my_speaker, SoundManager.UISounds.UPG_SUCCESS)
	if check_can_upgrade(stat_name):
		SoundManager.play_ui_sound(my_speaker, SoundManager.UISounds.UPG_SUCCESS)
		print("success upgrade")
		remove_currency(stat_name)
		upgrade_stat(stat_name)
	else:
		SoundManager.play_ui_sound(my_speaker, SoundManager.UISounds.UPG_FAIL)
		print("upgrade failed")
	#notify player to update self
	SignalBus.player_stats_updated.emit()
	
func _on_player_died():
	Globals.change_scene(death_scene)
