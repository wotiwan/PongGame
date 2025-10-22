extends CharacterBody2D

@export var speed = 400

var start_x = position.x

func _physics_process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_up"):
		direction -= 1
	if Input.is_action_pressed("ui_down"):
		direction += 1
	
	velocity.y = direction * speed
	move_and_slide()
	position.x = start_x  
	position.y = clamp(position.y, 0, 720)
