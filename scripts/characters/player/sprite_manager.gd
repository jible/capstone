extends Sprite2D

# Exports
@export var frame_size : Array[int] = [32,32]
@export var frame_rate: float = 4
@export var sm :StateMachine
@export var anims = {
	"idle": [
		0,2,
	],
	"walk": [
		3,0,4,0,
	],
	"hurt":[
		1,0,1
	],
	"attack": [
		5,6,7
	]
}

#Properties
var between_frames: float 
var current_frame_index : int = 0
var frame_progress : float = 0
var buffered_direction = null
var current_direction = 3

# On Readys
@onready var current_anim = anims["idle"]

# Main Functions

func _ready():
	between_frames = 1/frame_rate
	set_sprite(0)
	
func _process(delta):
	frame_progress +=delta

	if (frame_progress > between_frames):
		frame_progress = 0
		advance_frame()




func change_dir(dir):
	current_direction = dir
	update_sprite()
	
func change_anim(anim):
	current_anim = anims[anim]
	frame_progress = 0
	current_frame_index = 0
	update_sprite()
	
func update_sprite():
	set_sprite( current_anim[current_frame_index])



func _on_state_machine_state_changed(new_state):
	var anim = new_state.animation_name
	if buffered_direction:
		current_direction = buffered_direction
		buffered_direction = null
	if anim:
		change_anim(anim)



func advance_frame():
	current_frame_index += 1
	if current_frame_index >= current_anim.size():
		current_frame_index = 0
	update_sprite()


func set_sprite( col:int):
	region_rect = Rect2(col *frame_size[0], current_direction * frame_size[1], frame_size[0], frame_size[1])


func _on_direction_manager_direction_changed( direction):
	var new_dir = dir_to_column(direction)
	if sm.get_current_state_node().lock_direction:
		buffered_direction = new_dir
	else: 
		change_dir(new_dir)
	pass # Replace with function body.


func dir_to_column(dir):
	var dir_dict = {
		"south": 0,
		"north": 3,
		"east": 2,
		"west": 1,
	}
	return dir_dict.get(dir , "north")
