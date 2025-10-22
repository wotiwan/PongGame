extends CharacterBody2D

@export var speed = 600
var direction = Vector2.ZERO


func _ready():
	randomize_direction()

func randomize_direction():
	var angle = randf_range(-PI/4, PI/4)
	direction = Vector2(cos(angle), sin(angle)) if randi() % 2 == 0 else Vector2(-cos(angle), sin(angle))
	velocity = direction * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$HitSound.play()
	if position.x <= 0:
		get_parent()._on_ball_collide_with_wall("left")
	elif position.x >= 1280:
		get_parent()._on_ball_collide_with_wall("right")
