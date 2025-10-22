extends Control

@onready var restart_button = $RestartButton
@onready var menu_button = $BackButton

func _ready():
	
	restart_button.pressed.connect(_on_restart_button_pressed)
	menu_button.pressed.connect(_on_back_button_pressed)

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
