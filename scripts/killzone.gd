extends Area2D

func _on_body_entered(body):
	#body.get_node("CollisionShape2D").queue_free()
	print("You Died!")
	get_tree().reload_current_scene()
	#Engine.time_scale = 0.5
	#timer.start()

#func _on_timer_timout():
	#Engine.time_scale = 1.0
	#get_tree().reload_current_scene()
