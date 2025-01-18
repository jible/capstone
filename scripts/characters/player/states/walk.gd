extends SMState

# Exports
@export var max_speed: int
@export var acceleration: int
@export var player:CharacterBody2D
@export var lock_direction = false
@export var animation = {
	"framerate": 4,
	"frames": [3,0,4,0],
}

# On readys
@onready var sm = get_parent()




# Main Functions
func update_state(delta):
	if player.velocity.length() < 5:
		sm.change_state("Idle")
	pass
func enter_state():
	pass
func exit_state():
	pass
