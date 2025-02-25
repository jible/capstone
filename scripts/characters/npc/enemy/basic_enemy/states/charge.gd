extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "charge"

# On readys
@onready var sm = get_parent()
var direction_dependent = false
var callbacks = {
	"end": Callable(self, "anim_done")
}
var is_active = false

func anim_done():
	sm.change_state("Attack")

# Main Functions
func update_state(delta):
	pass
func enter_state():
	character.mobility_manager.input_direction = Vector2.ZERO
func exit_state():
	pass
