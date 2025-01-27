extends SMState


@export var lock_direction = false
@export var movement_details =  {}
@export var animation = {
	"frames": [1,1,1,1,1,1,1,],
	"framerate": 1
}


func update_state(delta):
	pass
func enter_state():
	print("playerDied")
	pass
func exit_state():
	pass
