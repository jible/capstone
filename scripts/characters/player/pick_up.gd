extends Area2D
class_name PickUp

func _on_area_entered(area : Collectable):
	collect(area.type, area.point_value)
	kill(area)

func collect(type, amount):
	SignalBus.item_collected.emit(type, amount)

func kill(collect):
	collect.queue_free()
