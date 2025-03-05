extends Area2D
class_name Collectible


var point_value = 1
var type = Globals.currency_key

@export var sprite : AnimatedSprite2D
@export var particle_emitter: CPUParticles2D


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
