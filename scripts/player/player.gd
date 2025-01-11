extends CharacterBody2D


@onready var mobility_manager= $"Mobility Manager"
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

var true_max_speed = 0
var true_acceleration = 0

var speed_mult = 1;

@export var action_sm: Node

func _physics_process(delta):
	var input_vector = InputManager.get_input_vector()
	action_sm.update_state(delta)
	mobility_manager.update_velocity(input_vector)
	move_and_slide()
	
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()


	
