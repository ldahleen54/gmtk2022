extends Node2D
onready var music_player = get_node("/root/BackgroundMusic")
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Input.action_release("ui_accept")
		music_player.change_music("start")
		get_tree().change_scene("res://scenes/title.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		Input.action_release("ui_cancel")
		music_player.change_music("start")
		get_tree().change_scene("res://scenes/title.tscn")

