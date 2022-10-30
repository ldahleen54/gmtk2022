extends Node

var items = ["dice necklace"]
const STARTING_HEALTH = 6
const STARTING_SCREENS_AWAY = 12
var health: int = STARTING_HEALTH
var screens_away: int = STARTING_SCREENS_AWAY
var in_danger: bool = false
# number of explored areas the plyaer will traverse them in order
var explored_up_to: int = 1
var position: Vector2 = Vector2()
onready var music_player = get_node("/root/BackgroundMusic")

func _process(delta):
	if health <= 0:
		# save game so progress is not lost
		self.save()
		music_player.change_music("start")
		print("changed to death scene")
		self.health = 6
		get_tree().change_scene("res://scenes/death.tscn")

func save():
	print("saving...")
	var file = File.new()
	file.open("user://bad_day.dat", File.WRITE)
	file.store_string(str(self.explored_up_to))
	file.close()

func load():
	print("loading...")
	var file = File.new()
	file.open("user://bad_day.dat", File.READ)
	var content = file.get_as_text()
	self.explored_up_to = int(content)
	file.close()
	
