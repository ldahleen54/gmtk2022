extends Node

var items = ["dice necklace"]
const STARTING_HEALTH = 6
var health: int = STARTING_HEALTH

func _process(delta):
	if health <= 0:
		get_tree().change_scene("res://scenes/death.tscn")
