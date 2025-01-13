class_name Player
extends CharacterBody2D


@onready var mobility_manager= $"Mobility Manager"
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

func _ready():
	# Give the script a reference to the player, so enemies don't have to get it from the scene tree.
	# (NPCs need a reference to the player for pathfinding)
	Globals.player = self

func _physics_process(delta):
	move_and_slide()
