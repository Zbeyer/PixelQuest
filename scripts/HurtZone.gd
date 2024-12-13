extends Area2D
	
func _on_body_entered(body):
	if body.has_method("player"):
		body.hearts -= 1
		body.on_hit()
		#body._on_hp_lose()
		#emit_signal("hp_lose", 1)
	
