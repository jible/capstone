extends Node
# Exports

@export var lock_direction = true
@export var movement_details =  {
	"moveable": false,
	"limit_velocity" : false
}
@export var knockback_velocity: float = 900
@export var animation_name = "hurt"
@export var character: CharacterBody2D
@export var speaker : AudioStreamPlayer2D
# Other Variables
@onready var sm = get_parent()
var sfx = SoundManager
var is_active = false
var health_manager: Health
var hurtbox:HurtBox
var mobility_manager: Node2D
var direction_dependent = true
var callbacks = {
	"start": [
		Callable(self, "knockback"),
	],
	"end": Callable(self,"end_hurt")
}
func _ready():
	health_manager = character.health_manager
	hurtbox = character.hurtbox
	mobility_manager = character.mobility_manager


func knockback():
	mobility_manager.set_velocity(knockback_velocity * hurtbox.latest_hit_direction)

func end_hurt():
	if health_manager.health <=0:
		sm.change_state("Death")
	else: 
		sm.change_state("Idle")

# Main Functions
func update_state(delta):
	pass
func enter_state():
	sfx.play_entity_sound(speaker,sfx.EntitySounds.HURT)
	pass
func exit_state():
	pass
