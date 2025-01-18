extends SMState

# Exports
@export var player:CharacterBody2D
@export var lock_direction = false
@export var animation = {
	"frames": [0,2],
	"framerate": 4
}
# On Readys
@onready var sm = get_parent()

# Main Functions 
func update_state(delta):
	if player.velocity.length() > 5:
		sm.change_state("Walk")
		return
	if Input.is_action_just_pressed("attack"):
		sm.change_state("Attack")
	
	pass
func enter_state():
	pass
func exit_state():
	pass
