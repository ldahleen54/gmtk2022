extends Node

var items = ["dice necklace"]
# not sure if this should be declared here or elsewhere and if this will be reset after every scene
var health: int = 6
var current_scene = null

func _process(delta):
	print("health: ", health)
	if health <= 0:
		print("You died")
		get_tree().change_scene("res://scenes/death.tscn")
