extends CharacterBody2D

@onready var mobility_manager= $"Mobility Manager"
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

func _physics_process(_delta):
	move_and_slide()
