#Based on Tutorial from Michael Games on YT
#https://www.youtube.com/watch?v=EbkKFOB4FpI
extends Node

func load_csv_dictionary(csv_path: String) -> Dictionary:
	var _csv_dictionary = {}
	var file = FileAccess.open(csv_path, FileAccess.READ)
	
	if file == null:
		printerr("No file found at: ", csv_path)
		return _csv_dictionary
	
	#load rest of lines as arr values	
	while not file.eof_reached():
		var line = file.get_csv_line()
		for value in line.size():
			if value == 0:
				_csv_dictionary[line[value]] = []
			else:
				_csv_dictionary[line[0]].append(float(line[value]))
	file.close()
	
	return _csv_dictionary
