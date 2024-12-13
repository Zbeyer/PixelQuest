extends Node2D

@onready var hp_1 = $hp1
@onready var hp_2 = $hp2
@onready var hp_3 = $hp3
@onready var hp_4 = $hp4
@onready var hp_5 = $hp5

#func _ready():

func update(num):
	if num >= 5:
		hp_5.gain()
		hp_4.gain()
		hp_3.gain()
		hp_2.gain()
		hp_1.gain()
	if num < 5:
		hp_5.lose()
	if num < 4:
		hp_4.lose()
	if num < 3:
		hp_3.lose()
	if num < 2:
		hp_2.lose()
	if num < 1:
		hp_1.lose()


func _on_player_hp_gain(index):
	pass # Replace with function body.


func _on_player_hp_lose(index):
	pass # Replace with function body.
