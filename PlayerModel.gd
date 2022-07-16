extends Node

var items = ["dice necklace"]
# not sure if this should be declared here or elsewhere and if this will be reset after every scene
var health: int = 6

func _process(delta):
	if health <= 0:
		get_tree().change_scene("res://scenes/death.tscn")
