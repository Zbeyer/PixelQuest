extends Area2D

signal my_signal

@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	
	if body.has_method("player"):
		body.add_point()
	animation_player.play("pickup")
	my_signal.emit()
