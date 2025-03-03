extends Node

var score = 0
var high_score = 0


func set_high_score(amount):
	high_score = amount

func increase_score(amount):
	set_score(score + amount)

func set_score(value):
	score = value
	if score > high_score:
		high_score = score


func save():
	return ({"high_score": high_score})

func load_save(data):
	high_score = data.get( "high_score", 0 )
