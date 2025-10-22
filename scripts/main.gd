extends Node2D

var player_score = 0
var enemy_score = 0
@onready var score_label = $ScoreLabel  
@onready var ball = $Ball
	
func _on_ball_collide_with_wall(side):
	if side == "right":
		player_score += 1
	elif side == "left":
		enemy_score += 1
		print (score_label.text)
	score_label.text = str(player_score) + " : " + str(enemy_score)
	reset_ball()

func reset_ball():
	ball.position = Vector2(512, 300)
	ball.randomize_direction()
	
