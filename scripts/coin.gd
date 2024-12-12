extends Area2D

signal my_signal

@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	game_manager.add_point()
	animation_player.play("pickup")
	my_signal.emit()
