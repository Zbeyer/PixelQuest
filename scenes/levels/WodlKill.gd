extends Area2D

func _ready():
	print("World kill ready")

func reset():
	print("You Died!")
	get_tree().reload_current_scene()

func _on_body_entered(body):
	reset()
