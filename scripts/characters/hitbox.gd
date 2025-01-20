class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev

@export var damage: int = 1
@export var collision: CollisionShape2D

func _ready():
	pass



func _on_area_entered(area):
	print("entered hitbox")
	pass # Replace with function body.


func turn_on():
	collision.disabled = false


func turn_off():
	collision.disabled = true


func set_damage(value: int):
	damage = value
	
	
func get_damage():
	return damage


func hit( hurtbox: HurtBox):
	print ("smacked them1")
	pass


#func get_shape_size(shape, axis):
	#if shape is RectangleShape2D:
		#return shape.extents
	#elif shape is CircleShape2D:
		#return shape.radius
	#


#func rotate_hitbox(direction: Vector2):
	#
	#if (dir_vector.x != 0):
		#dir_vector = dir_vector * (collision.shape.)
	#pass
#
#
#func move_hitbox(position):
	#collision.position = position
	#pass
