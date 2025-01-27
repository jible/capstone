extends CharacterBody2D


func _physics_process(_delta):
	move_and_slide()


func get_direction():
	return velocity
