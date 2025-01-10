extends CharacterBody2D
## The player's max speed
@export var max_speed = 100
@export var acceleration = 10

@onready var input_vector = Vector2.ZERO


func _physics_process(delta):
	input_vector = Vector2.ZERO
	if Input.is_action_pressed("up"):
		input_vector.y -= 1
	if Input.is_action_pressed("down"):
		input_vector.y += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	
	
	
	velocity += input_vector * acceleration
	velocity *= .9
	velocity.limit_length(max_speed)
	

	move_and_slide()
