extends SMState


@export var hurtbox: HurtBox
@export var character:CharacterBody2D
@export var lock_direction = false
@export var invincibility_time: float = 2
@export var movement_details =  {}
@onready var sm = get_parent()

@export var animation = {
	"frames": [1,0,1],
	"framerate": 6,
	"callbacks" :{
		0: Callable(self, "temp_invincibility"),
		"end": Callable(self, "end_hurt"),
	}
}
func temp_invincibility():
	hurtbox.turn_off_for_sec(invincibility_time)

func turn_off_hurtbox():
	hurtbox.turn_off()
	pass
	
	
func turn_on_hurtbox():
	hurtbox.turn_on()
	

func end_hurt():
	sm.change_state("Idle")

func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
