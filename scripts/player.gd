extends CharacterBody2D

@export var speed = 400

func _physics_process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_up"):
		direction -= 1
	if Input.is_action_pressed("ui_down"):
		direction += 1
	velocity.y = direction * speed
	velocity.x = 0 
	move_and_slide()
	position.y = clamp(position.y, 0, 720)  
