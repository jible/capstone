extends Node
	
	
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
	
	
