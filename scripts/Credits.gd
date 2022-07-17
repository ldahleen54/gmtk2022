extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Input.action_release("ui_accept")
		get_tree().change_scene("res://scenes/title.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		Input.action_release("ui_cancel")
		get_tree().change_scene("res://scenes/title.tscn")

