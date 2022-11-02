extends Node2D
onready var music_player = get_node("/root/BackgroundMusic")
func _ready():
	music_player.stop_music()

	
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		Input.action_release("ui_accept")
		music_player.change_music("safe")
		get_tree().change_scene("res://scenes/safe/start.tscn")
