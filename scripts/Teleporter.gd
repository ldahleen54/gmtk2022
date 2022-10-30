# Contains logic for teleporting
extends Object

class_name Teleporter

const dangerous_scenes = [
	"res://scenes/dangerous/danger1.tscn",
	"res://scenes/dangerous/danger2.tscn",
	"res://scenes/dangerous/danger3.tscn",
	"res://scenes/dangerous/danger4.tscn",
	"res://scenes/dangerous/danger5.tscn",
	"res://scenes/dangerous/danger6.tscn",
	"res://scenes/dangerous/danger7.tscn",
	"res://scenes/dangerous/danger8.tscn",
	"res://scenes/dangerous/danger9.tscn",
	"res://scenes/dangerous/danger10.tscn",
	"res://scenes/dangerous/danger11.tscn",
	"res://scenes/dangerous/danger12.tscn",
]

# randomly teleport to a dangerous area
static func random_teleport(model, music_player, tree):
	# generate random seed
	randomize()
	# selects a random integer
	var scene_number = rand_range(0, len(dangerous_scenes)) as int
	print("Randomly teleported to scene: ", dangerous_scenes[scene_number])
	model.in_danger = true
	music_player.change_music("danger")
	tree.change_scene(dangerous_scenes[scene_number])
	print("scene_number", scene_number)
	
