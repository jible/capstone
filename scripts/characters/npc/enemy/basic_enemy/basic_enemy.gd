extends CharacterBody2D


@export var drop : PackedScene




func death_drop():
	if drop:
		var instance = drop.instantiate()
		instance.position = position
		get_tree().current_scene.add_child(instance)

func die():
	death_drop()
	self.queue_free()

func _physics_process(_delta):
	move_and_slide()


func get_direction():
	return velocity


func _on_death_died():
	die()
	pass # Replace with function body.
