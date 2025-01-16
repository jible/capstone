extends Sprite2D


@export var frame_size : Array[int] = [32,32]
@export var frame_rate: float = 4
var between_frames: float 
var current_frame_index : int = 0
var frame_progress : float = 0
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
@onready var current_anim = anims["attack"]
var current_direction = 3

func _ready():
	between_frames = 1/frame_rate
	print(between_frames)
	set_sprite(0)



var dirToColumn = {
	"south": 0,
	"north": 3,
	"east": 2,
	"west": 1,
}

func change_dir(dir):
	current_direction = dirToColumn[dir]
	update_sprite()
	
func change_anim(anim):
	current_anim = anims[anim]
	frame_progress = 0
	current_frame_index = 0
	update_sprite()
	
func update_sprite():
	set_sprite( current_anim[current_frame_index])



func _process(delta):
	frame_progress +=delta

	if (frame_progress > between_frames):
		frame_progress = 0
		advance_frame()



func advance_frame():
	current_frame_index += 1
	if current_frame_index >= current_anim.size():
		current_frame_index = 0
	update_sprite()


func set_sprite( col:int):
	# this one line is from chatgpt- i just wanted the syntax!
	# I typed it in and didn't paste it!
	region_rect = Rect2(col *frame_size[0], current_direction * frame_size[1], frame_size[0], frame_size[1])
