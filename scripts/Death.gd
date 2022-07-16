extends Node2D

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		Input.action_release("ui_accept")
		var player_model = get_node("/root/PlayerModel")
		player_model.health = player_model.STARTING_HEALTH
		get_tree().change_scene("res://scenes/title.tscn")
