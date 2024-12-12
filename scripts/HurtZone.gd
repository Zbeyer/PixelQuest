extends Area2D

@onready var player = $Player

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func _on_body_entered(body):
	body.on_hit()
	#player.on_hit()
	
# 	Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

	body.global_position.x = 0
	body.global_position.y = 0
	$CollisionShape2D.set_deferred("disabled", false)
