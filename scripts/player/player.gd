extends CharacterBody2D


@export var max_speed: int
@export var acceleration: int
@export var drag_coefficient: float

@onready var drag:float  = 1.0 - drag_coefficient

var input_manager = "res://scripts/player/input_manager.gd"
var speed_mult = 1;

@export var action_sm: Node
@export var mobility_sm: Node

func _physics_process(delta):
	var input_vector = get_input_vector()
	action_sm.update_state(delta)
	mobility_sm.update_velocity(input_vector)
	
	move_and_slide()


func get_input_vector():
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("up"):
		input_vector.y -= 1
	if Input.is_action_pressed("down"):
		input_vector.y += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	input_vector = input_vector.normalized()
	return input_vector
	
