extends Node2D

@onready var animation_player = $AnimationPlayer

func lose():
	animation_player.play("lose")

func gain():
	animation_player.play("gain")
