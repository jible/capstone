extends SMState

@export var death_scene :String = "res://scenes/testScenes/main_menu.tscn"
@export var lock_direction = false
@export var movement_details =  {}
@export var animation = {
	"frames": [1,1,1,1,1,1,1,],
	"framerate": 1
}

func update_state(delta):
	pass
func enter_state():
	SignalBus.player_die.emit()
	Globals.change_scene(load(death_scene))
	pass
func exit_state():
	pass
