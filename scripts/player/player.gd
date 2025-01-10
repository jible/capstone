extends CharacterBody2D
## The player's max speed
@export var max_speed: int
@export var acceleration: int
@onready var input_vector = Vector2.ZERO
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient
## Reference to the state machine from the scene hierarchy 
@export var sm: Node


func _physics_process(delta):
	print(drag,"and ",  drag_coefficient)
	
	input_vector = Vector2.ZERO
	if Input.is_action_pressed("up"):
		input_vector.y -= 1
	if Input.is_action_pressed("down"):
		input_vector.y += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	
	input_vector = input_vector.normalized()
	
	velocity += input_vector * acceleration
	velocity *= drag
	velocity.limit_length(max_speed)
	
	sm.update_state(delta)

	
	move_and_slide()
