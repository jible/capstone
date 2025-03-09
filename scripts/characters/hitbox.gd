class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev
@export var character:CharacterBody2D
@export var damage: int = 1
@export var collision: CollisionShape2D
@export var detecting:bool = false
@export var distance_from_parent: int = 130
@export var knockback = 50
@export var collisionshape :CollisionShape2D
@export var on_swivel = false
@export var raycasts: Array[RayCast2D]
# Set the reference for this if you want the hitbox to be able to pick up items.
@export var item_pick_up: PickUp
var overlapping_hurtboxes = []
var successful_hit = []

var overlapping_items = []

func turn_on():
	collisionshape.debug_color = Color (179, 57, 81, .5)
	for area in overlapping_hurtboxes:
		if area is HurtBox && area.detectable && ! (area in successful_hit):
			attempt_hit(area)
	
	if item_pick_up:
		for area in overlapping_items:
			if area is Collectible:
				item_pick_up.collect_item(area)
	
	detecting = true

func turn_off():
	collisionshape.debug_color = Color (145, 199, 177,0)
	successful_hit = []
	detecting = false

func _on_area_entered(area):
	if area is HurtBox:
		overlapping_hurtboxes.append(area)
		if detecting && area.detectable:
			attempt_hit(area)
	elif area is Collectible:
		overlapping_items.append(area)
		if detecting:
			item_pick_up.collect_item(area)

func _on_area_exited(area):
	if area is HurtBox:
		overlapping_hurtboxes.erase(area)
	if area is Collectible:
		overlapping_items.erase(area)
		

func _on_direction_manager_direction_changed(direction: Vector2):
	if !on_swivel :
		move_direction(direction)

#TODO node sure if this if statement is a good thing to put in a physics process call. It looked a little messy
# when I tried adding a signal listener to get the current state on state change and hard set a bool.
func _physics_process(delta):
	if on_swivel && ! character.state_machine.get_current_state_node().lock_direction:
		move_to (character.get_direction().normalized() * distance_from_parent ) 

func set_damage(value: int):
	damage = value

func increase_damage(value: int):
	damage += value

func get_damage():
	return damage

# Chatgpt conversation: https://chatgpt.com/share/67cb7c74-5090-8000-8d34-20540e58bb20
func attempt_hit( hurtbox: HurtBox):
	if ( raycasts.size() == 0 ):
		hit(hurtbox)
		return
	# Check for los before landing hit
	
	for raycast in raycasts:
		raycast.target_position = raycast.to_local(hurtbox.global_position)
		raycast.force_raycast_update()
		if (  !raycast.is_colliding() ):
			hit(hurtbox)
			return
	
func hit( hurtbox: HurtBox):
	successful_hit.append(hurtbox)
	hurtbox.hit_by(self)
	pass

func move_direction(direction):
	move_to(direction * distance_from_parent)

func move_to(target_position):
	position = target_position
