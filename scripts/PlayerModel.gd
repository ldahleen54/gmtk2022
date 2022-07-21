extends Node

var items = ["dice necklace"]
const STARTING_HEALTH = 6
const STARTING_SCREENS_AWAY = 12
var health: int = STARTING_HEALTH
var screens_away: int = STARTING_SCREENS_AWAY
var position: Vector2 = Vector2()
onready var music_player = get_node("/root/BackgroundMusic")

func _process(delta):
	if health <= 0:
		music_player.change_music("start")
		print("changed to death scene")
		self.health = 6
		get_tree().change_scene("res://scenes/death.tscn")
	
