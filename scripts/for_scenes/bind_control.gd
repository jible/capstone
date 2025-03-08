#based off of Easy Input Settings Menu by DashNothing
#https://www.youtube.com/watch?v=ZDPM45cHHlI

extends Control

@onready var binding_button: Button = $BindingButton

var is_remapping: bool = false

func _on_binding_button_pressed() -> void:
	is_remapping = true

func _input(event: InputEvent) -> void:
	if is_remapping:
		if (
			event is InputEventKey || 
			(event is InputEventMouseButton && event.is_pressed())
		):
			#bind to input map
			pass
	
