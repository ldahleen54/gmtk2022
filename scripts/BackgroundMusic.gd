extends Node
var previous_area = "start"
onready var player = AudioStreamPlayer.new()
func _ready():
	self.add_child(player)
	player.stream = load("res://assets/music/title.mp3")
	player.play()

func change_music(area: String):
	if previous_area == area:
		return null
	if area == "safe":
		player.stream = load("res://assets/music/safezone.mp3")
		player.play()
	elif area == "danger":
		player.stream = load("res://assets/music/danger.mp3")
		player.play()
	elif area == "credits":
		player.stream = load("res://assets/music/credits.mp3")
		player.play()
	elif area == "start":
		player.stream = load("res://assets/music/title.mp3")
		player.play()
	else:
		# default case
		print("playing default music probably a BUG")
		player.stream = load("res://assets/music/safezone.mp3")
