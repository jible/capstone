extends Node 

# upgradable stats
const HEALTH: String = "health"
const DMG: String = "dmg"
const SPEED: String = "speed"
const STAT_SHEET_PATH: String = "res://assets/csvs/Cast Into Flame Stat Sheet - upgrades.csv"
const MAX_LEVEL: int = 9

var stat_lvl: Dictionary = {
	"health": 0,
	"dmg": 0,
	"speed": 0
}

var stat_growth: Dictionary = LoadCsv.load_csv_dictionary(STAT_SHEET_PATH)

var upgrade_bonus: Dictionary = {
	"health": 0,
	"dmg": 0,
	"speed": 0
}
var upgrade_cost = 1

##Death Scene
var death_scene: PackedScene = preload(
	"res://scenes/prefabs/ui_elements/death_screen.tscn")

func _ready(): 
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)
	SignalBus.player_die.connect(_on_player_died)
	
func check_can_upgrade(stat: String) -> bool:
	if (get_upgrade_cost(stat) <= Inventory.check_item(Globals.currency_key) 
		&& get_stat_lvl(stat) < MAX_LEVEL):
			return true
	return false

func upgrade_stat(stat: String):
	stat_lvl[stat] += 1
	upgrade_bonus[stat] += get_stat_growth(stat)
	
func get_stat(stat: String):
	return upgrade_bonus[stat]

func get_stat_lvl(stat: String):
	return stat_lvl[stat]
	
func get_stat_growth(stat: String):
	return stat_growth[stat][stat_lvl[stat]]
	
#TODO convert to use array indices from csv?
func get_upgrade_cost(stat: String):
	if get_stat_lvl(stat) == 0:
		return upgrade_cost
	else:
		return get_stat_lvl(stat) * upgrade_cost

func remove_currency(stat: String):
	Inventory.items[Globals.currency_key] -= get_upgrade_cost(stat)
	SignalBus.currency_changed.emit()

func _on_stat_upgraded(stat_name: String):
	if check_can_upgrade(stat_name):
		remove_currency(stat_name)
		upgrade_stat(stat_name)
		SignalBus.upgrade_success.emit()
		SignalBus.player_stat_upgraded.emit(stat_name)
	else:
		SignalBus.upgrade_fail.emit()
	
func _on_player_died():
	reset_upgrades()
	pass

func reset_upgrades():
	for key in stat_lvl:
		stat_lvl[key] = 0
		upgrade_bonus[key] = 0
