extends Node
class_name Pool

var path : String
var entity
var collection = []

func _init(root: Node, ref: String, amount):
	path = ref
	entity = load(ref)
	for items in range(amount):
		var instance = entity.instantiate()
		collection.append(instance)
		root.add_child(instance)


func kill(object: Node):
	turn_off(object)

func add( position = Vector2.ZERO):
	if (collection.size() <= 0 ):
		print("pool is empty")
		return null
	var object = collection.pop_back()
	if object.position:
		object.position = position
	turn_on(object)


func turn_off(object):
	object.set_process(false)
	object.set_physics_process(false)
	if object.has_method("hide"):
		object.hide()
	for child in object.get_children():
		turn_off(child)

func turn_on(object):
	object.set_process(true)
	object.set_physics_process(true)
	if object.has_method("show"):
		object.show()
	for child in object.get_children():
		turn_on(child)
