extends Node2D


@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient
