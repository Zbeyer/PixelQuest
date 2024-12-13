extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# TODO:signal refactor
# Player can emit damage_taken(amt: int) and health_gained(amt: int) 
# signals without caring about what the hp display component does with this info
signal hp_gain(index)
signal hp_lose(index)

var score = 0
var hearts = 5
var direction = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var MyScore = $ui/MyScore
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var health_bar = $HealthBar
@onready var death_timer = $DeathTimer
@onready var collision_shape_2d = $CollisionShape2D
@onready var hit_timer = $HitTimer

func add_point():
	score += 1
	print(score)
	MyScore.text = str(score)
	
func _ready():
	reset()
	
func player():
	pass
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction -1 or 1
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")	
		else:
			animated_sprite_2d.play("run")
	else:
					animated_sprite_2d.play("jump")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	move_and_slide()

func on_hit():
	health_bar.update(hearts)
	# 	Must be deferred as we can't change physics properties on a physics callback.
	collision_shape_2d.set_deferred("disabled", true)

	
	var knockback = Vector2(-1 * direction * SPEED * 50, -200)
	velocity = knockback
	move_and_slide()
	
	self.modulate = "#FF0000"
	hit_timer.start()
		
	collision_shape_2d.set_deferred("disabled", false)
	if hearts <= 0:
		hearts = 0
		on_death()

func on_death():
	print("You Died!")
	collision_shape_2d.queue_free()
	health_bar.visible = false
	death_timer.start()

func _on_death_timer_timeout():
	get_tree().reload_current_scene()
	reset()
	
func reset():
	hearts = 5
	health_bar.visible = true

func _on_hit_timer_timeout():
	self.modulate = "#FFFFFF"

func _on_hp_gain(index):
	pass # Replace with function body.

func _on_hp_lose(index):
	index = index || 1
	hearts = hearts - index
	on_hit()
 	
