extends CharacterBody2D

@export var speed = 300
@onready var ball = get_parent().get_node("Ball")

var start_x = position.x

func _physics_process(delta):
	if ball:
		var target_y = ball.position.y
		var direction = sign(target_y - position.y)
		velocity.y = direction * speed
		
		move_and_slide()
		position.x = start_x  
		position.y = clamp(position.y, 0, 720)
		
