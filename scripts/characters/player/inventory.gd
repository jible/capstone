extends Node2D

class_name Inventory

var items = {}

func obtain_item(currency_type,amount):
	items[currency_type] =  items.get(currency_type, 0 ) + amount
	
func check_item(type):
	if type in items:
		return items[type]
	return 0


func _on_pick_up_item_collected(type, amount):
	obtain_item(type, amount)
	SignalBus.currency_changed.emit()
