extends CharacterBody2D


@onready var mobility_manager= $"Mobility Manager"


func _physics_process(_delta):
	move_and_slide()
