extends CharacterBody2D


@onready var mobility_manager= $"Mobility Manager"
@onready var health_manager= $"Health Manager"
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient


func _physics_process(_delta):
	move_and_slide()

func _ready():
	SignalBus.player_stats_updated.connect(update_stats)
	pass

func update_stats():
	health_manager.increase_starting_health(UpgradeManager.health_increase)
	print("player max health is now: ", health_manager.max_health)
	
	# TODO:
	# hook up player dmg and speed to upgrades
	# hook up health upgrades to UI w/ signals
	pass
