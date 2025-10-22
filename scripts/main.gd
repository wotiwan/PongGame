extends Node2D

var player_score = 0
var enemy_score = 0
const MAX_SCORE = 5

@onready var score_label = $ScoreLabel  
@onready var ball = $Ball

func _on_ball_collide_with_wall(side):
	if side == "right":
		player_score += 1
	elif side == "left":
		enemy_score += 1

	score_label.text = str(player_score) + " : " + str(enemy_score)
	
	if player_score >= MAX_SCORE:
		end_game(true)  
	elif enemy_score >= MAX_SCORE:
		end_game(false) 
	else:
		reset_ball()

func reset_ball():
	ball.position = Vector2(720, 360)
	ball.randomize_direction()

func end_game(player_won: bool):
	hide()  

	var next_scene: PackedScene

	if player_won:
		next_scene = preload("res://scenes/Victory.tscn")
	else:
		next_scene = preload("res://scenes/Defeat.tscn")

	var scene_instance = next_scene.instantiate()
	get_tree().root.add_child(scene_instance)
