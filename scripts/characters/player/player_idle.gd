extends SMState


@export var player:CharacterBody2D
var mobility = "Default"
@export var max_speed: int= -1
@export var acceleration: int = -1
@onready var sm = get_parent()

func update_state(delta):
	if player.velocity.length() > 5:
		sm.change_state("Walk")
	pass
func enter_state():
	pass
func exit_state():
	pass
