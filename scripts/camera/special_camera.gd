extends Camera2D
# Broken for now
# taken from https://github.com/jible/BallGame/blob/main/Scripts/SpecialCamera.gd

@export var follow_speed: float = 2
@export var target: Node = null
@export var follow_player: bool

@export var free_axis = { 
	'x': 100,
	'y': 100,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	if follow_player:
		assert(target !=null, "no player found for camera")
		position = target.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (follow_player):
		pursuit(delta)
	pass

func pursuit(delta):
	if target:
		# Get the current position of the camera and the target's position
		var target_position = target.position 
		if abs(target_position.x - position.x) < free_axis["x"]:
			target_position.x = position.x
		if abs(target_position.y - position.y) < free_axis["y"]:
			target_position.y = position.y
			
		# Interpolate between the current position and the target position
		var new_position = lerp(position
		, target_position, delta * follow_speed)

		# Update the camera's position
		position = new_position
