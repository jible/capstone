extends Camera2D

var zoom_speed = 0.1
var move_speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("debug_zoom_in"):
		zoom_in()
	
	if Input.is_action_pressed("debug_zoom_out"):
		zoom_out()
	
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	position += direction.normalized() * move_speed * delta

func zoom_in():
	zoom += Vector2(zoom_speed, zoom_speed)

func zoom_out():
	zoom -= Vector2(zoom_speed, zoom_speed)
	zoom = zoom.max(Vector2(0.1, 0.1))
