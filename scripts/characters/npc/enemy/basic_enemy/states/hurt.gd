extends Node
# Exports

@export var lock_direction = false
@export var movement_details =  {
	"moveable": false,
}
@export var knockback_velocity: float = 900
@export var animation = {
	"frames": [6,7,8],
	"framerate": 4,
	"callbacks" : {
		0: [
			Callable(self, "knockback"),
		],
		"end": Callable(self,"end_hurt")
	}
}

@export var health_manager: Health
@export var hurtbox:HurtBox
@export var mobility_manager: Node2D

# On readys
@onready var sm = get_parent()

func knockback():
	mobility_manager.set_velocity(knockback_velocity * hurtbox.latest_hit_direction)


func end_hurt():
	if health_manager.health <=0:
		sm.change_state("Death")
	else: 
		sm.change_state("Pursuit")


	# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
