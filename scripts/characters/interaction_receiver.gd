class_name interactionReceiver
extends Area2D

@export var interaction_handler: Node

func interact_success(trigger):
	trigger.interact_success()
	interaction_handler.fire(trigger)

func _on_area_entered(trigger: InteractionTrigger):
	interact_success(trigger)
	pass # Replace with function body.
