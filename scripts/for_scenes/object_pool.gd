class_name Pool

var path : String
var entity
var collection = []

func _init(ref: String, amount):
	path = ref
	entity = load(ref)
	
	for items in range(amount):
		collection.append(entity.instantiate())

func kill(object):
	if object.reset:
		object.reset()
	collection.append(object)
	object.get_parent().remove_child(object)

func add(root):
	if (collection.size() <= 0 ):
		print("pool is empty")
		return null
	var object = collection.pop_back()
	call_deferred("add_to_tree", root, object)
	return (object)

# seperated this into a function so I could defer the call.
func add_to_tree(root, object):
	root.add_child(object)
