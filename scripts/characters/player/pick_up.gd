extends Area2D
class_name PickUp


signal item_collected


func _on_area_entered(area : Collectable):
	collect(area.type, area.point_value)
	kill(area)
	pass # Replace with function body.


func collect(type, amount):
	emit_signal("item_collected", type, amount )
	pass

func kill(collect):
	collect.queue_free()
