extends CharacterBody2D

@export var speed = 300
@onready var ball = get_parent().get_node("Ball")

func _physics_process(delta):
	if ball:
		var target_y = ball.position.y
		var direction = sign(target_y - position.y)
		velocity.y = direction * speed
		velocity.x = 0 
		move_and_slide()
		position.y = clamp(position.y, 0, 720)
		
