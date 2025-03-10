extends Node

# This is the core of our save system. each object should include a reference to a global script 
# and all variables on that script that need to be saved
var save_locations = {
	"score_manager": ScoreManager,
	"shader_manager": ShaderManager,
	"translation": Globals,
}
var save_path = "user://savegame.save"



func _ready():
	SignalBus.connect("player_die", save_game)

func _process(delta):
	if Input.is_action_just_pressed("debug_delete_save"):
		clear_save()

# used chatgpt to double check the functionality
# conversation: https://chatgpt.com/share/67c62d00-08f4-8012-974d-f915c4d82c4c

# Save and load game from documentation:
# https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
func save_game():
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	
	for script_name in save_locations:
		var script = save_locations[script_name]
		if !script.has_method("save"):
			# Do not call save on a script that does not have the method
			continue
		
		var data = script.save()
		data["save_name"] = script_name
		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(data)

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)


# Note: This can be called from anywhere inside the tree. This function
# is path independent.
func load_game():
	if not FileAccess.file_exists(save_path):
		return # Error! We don't have a save to load.
	
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open(save_path, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var data = json.data
		
		var save_name = data["save_name"]
		var script = save_locations[save_name]
		# Now we set the remaining variables.
		if !script.has_method("load_save"):
			# Do not call save on a script that does not have the method
			continue
		script.load_save(data)


func clear_save():
	if not FileAccess.file_exists(save_path):
		return # Error! We don't have a save to load.
	var save_file: FileAccess = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.resize(0)
	save_file.close()
	for script_name in save_locations:
		var script = save_locations[script_name]
		if script.has_method("delete_save"):
			script.delete_save()
