extends Node

var score = 0

@onready var my_score = $"../Player/cam/myScore"

func add_point():
	score += 1
	print(score)
	my_score.text = str(score)
