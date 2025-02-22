extends Node


# Exports
@export var hitbox: HitBox
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "pursuit"
@export var mobility_manager: Node2D

# Other variables
@onready var sm = get_parent()
var callbacks = {}
var direction_dependent = true
var timer:Timer
var target: Node2D

# Functions
func _ready():
	make_timer()


func make_timer():
	timer = Timer.new()
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	#timer.timeout.connect(update_position)
	timer.start()
	

# Required state functions
func update_state(delta):
	var target_vector =  character.navigator.get_next_step() - character.global_position 
	if target_vector == null:
		return
	if (target_vector.length() < 10):
		target_vector = Vector2.ZERO
	else:
		target_vector = target_vector.normalized()
	mobility_manager.input_direction = target_vector


func enter_state():
	# turn on hitbox
	hitbox.turn_on()
	character.navigator.turn_on()
	pass
	
func exit_state():
	# turn off hitbox
	hitbox.turn_off()
	character.navigator.turn_off()
	
	
	mobility_manager.input_direction = Vector2.ZERO
	pass
