@tool
extends Control

@export var controls: Array[String]:
	set(new_control):
		controls = new_control
		create_control()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_control():
	print("new control added")
