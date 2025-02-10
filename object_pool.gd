class_name Pool


var path : String
var entity
var collection = []


func _init(ref: String, amount):
	path = ref
	entity = load(ref)
	
	for items in range(amount):
		collection.append(entity.instantiate())


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
