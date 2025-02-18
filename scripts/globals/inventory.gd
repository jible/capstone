extends Node2D

var items = {}

func _ready() -> void:
	SignalBus.item_collected.connect(_on_pick_up_item_collected)

func obtain_item(currency_type,amount):
	items[currency_type] =  items.get(currency_type, 0 ) + amount
	
func check_item(type):
	if type in items:
		return items[type]
	return 0

func _on_pick_up_item_collected(type, amount):
	obtain_item(type, amount)
	SignalBus.currency_changed.emit()
