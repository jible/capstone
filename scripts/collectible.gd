extends Area2D
class_name Collectible


var point_value = 1
var type = Globals.currency_key
var target = null
var gravitate = false


# Gravitation details
@export var vel = Vector2.ZERO
@export var acceleration = 100
@export var max_vel = 5000
@export var drag = .9


@export var sprite : AnimatedSprite2D
@export var particle_emitter: CPUParticles2D

func _process(delta):
	if gravitate:
		var direction = (target.global_position - global_position).normalized()
		vel += acceleration * direction * delta
	vel -= (vel * (1 - drag))
	vel = vel.limit_length(max_vel)
	position += vel

func prep( package ):
	var sprite_frames = package.get("sprite_frames", null)
	var particle_path = package.get("sprite_frames", null)
	point_value = package.get("point_value", 1)
	type = package.get("type", Globals.currency_key)
	
	if package["sprite_frames"]:
		sprite.visible = true
		sprite.sprite_frames = sprite_frames
	else:
		sprite.visible = false
	
	
	if particle_path:
		particle_emitter.visible = true
		particle_emitter.texture = particle_path
	else:
		particle_emitter.visible = false


func _on_area_entered(area):
	var temp = area.get_parent()
	if temp.is_in_group("Player"):
		target = temp
		gravitate = true 
	
	pass # Replace with function body.


func _on_area_exited(area):
	if area.get_parent() == target:
		gravitate = false
		target = null
	return
