extends KinematicBody2D
export (int) var speed = 200

var velocity = Vector2()
onready var player_model = get_node("/root/PlayerModel")
onready var music_player = get_node("/root/BackgroundMusic")
onready var player_node = get_node("PlayerBody")

var receives_knockback: bool = true
var knockback_modifier: float = 1

# scenes to choose from that can be teleported to includes danger zones that are not on the edge
const scenes = [
	"res://scenes/safe/safe1.tscn",
	"res://scenes/safe/safe2.tscn",
	"res://scenes/safe/safe3.tscn",
	 "res://scenes/safe/safe4.tscn",
	 "res://scenes/safe/safe5.tscn",
	 "res://scenes/safe/safe6.tscn",
	 "res://scenes/safe/safe7.tscn",
	 "res://scenes/safe/safe8.tscn",
	 "res://scenes/safe/safe9.tscn",
	 "res://scenes/safe/safe10.tscn",
	 "res://scenes/safe/safe11.tscn",
	 "res://scenes/secret/secret1.tscn",
	 "res://scenes/secret/secret2.tscn",
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

# Called when the node enters the scene tree for the first time.
func _ready():
	print("player health: ", player_model.health)
	var n = String(name).to_lower()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	#DEBUG
	if Input.is_action_just_pressed("damage"):
		player_model = get_node("/root/PlayerModel")
		player_model.health = player_model.health - 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	player_model.position = position
	velocity = move_and_slide(velocity)

func _on_RandomTeleporter_body_entered(body):
	randomize()
	var sceneNumber = rand_range(0, len(scenes)) as int
	if body.name == "PlayerBody":
		print("Randomly teleported to scene: ", scenes[sceneNumber])
		if sceneNumber > 12:
			music_player.change_music("danger")
			get_tree().change_scene(scenes[sceneNumber])
		elif sceneNumber == 11 or sceneNumber == 12:
			music_player.change_music("secret")
			get_tree().change_scene(scenes[sceneNumber])
		else:
			music_player.change_music("safe")
			get_tree().change_scene(scenes[sceneNumber])
		print("sceneNumber", sceneNumber)


func _on_RandomTeleporter2_body_entered(body):
	_on_RandomTeleporter_body_entered(body)

func _on_RandomTeleporter3_body_entered(body):
	_on_RandomTeleporter_body_entered(body)
	
func change_scene_safe(sceneNumber):
	var scene = "res://scenes/safe/safe" + sceneNumber as String + ".tscn"
	music_player.change_music("safe")
	print("Moved to scene: ", scene)
	get_tree().change_scene(scene)
	
func change_scene_secret(sceneNumber):
	var scene = "res://scenes/secret/secret" + sceneNumber as String + ".tscn"
	print("Moved to scene: ", scene)
	music_player.change_music("secret")
	get_tree().change_scene(scene)

func change_scene_test(sceneNumber):
	var scene = "res://scenes/test/test" + sceneNumber as String + ".tscn"
	print("Moved to scene: ", scene)
	get_tree().change_scene(scene)

func _on_Area2D_body_entered(body):
	var player_model = get_node("/root/PlayerModel")
	player_model.health = player_model.health - 1

func _on_StartTeleporter_body_entered(body):
	if body.name == "PlayerBody":
		print ("Moved to scene: Start")
		get_tree().change_scene("res://scenes/safe/start.tscn")

func _on_Safe1Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(1)

func _on_Safe2Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(2)

func _on_Safe3Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(3)

func _on_Safe4Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(4)

func _on_Safe5Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(5)

func _on_Safe6Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(6)

func _on_Safe7eleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(7)
		
func _on_Safe8Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(8)
		
func _on_Safe9Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(9)

func _on_Safe10Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(10)

func _on_Safe11Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(11)

func _on_Safe12Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_safe(12)

func _on_Enemy1_body_entered(body):
	if body.name == "PlayerBody":
		receive_knockback(body.global_position)
		player_model.health = player_model.health - 1

func _on_Enemy2_body_entered(body):
	if body.name == "PlayerBody":
		receive_knockback(body.global_position)
		player_model.health = player_model.health - 1
		
func _on_Spring_body_entered(body):
	if body.name == "PlayerBody":
		var scene = "res://scenes/credits.tscn"
		print("Moved to scene: ", scene)
		music_player.change_music("credits")
		get_tree().change_scene(scene)

func receive_knockback(damage_source_pos: Vector2):
	print("receiving knockback")
	randomize()
	var x_direction = randi() % 3
	var y_direction = randi() % 3
	var random = randi() % 1
	if y_direction == 2:
		y_direction = -1
	if x_direction == 2:
		x_direction = -1
	if x_direction == 0 and y_direction == 0:
		x_direction = random + 1
	var knockback_direction = Vector2(x_direction, y_direction)
	var knockback_strength = knockback_modifier
	var knockback = knockback_direction * 300
	print("total knockback received", knockback)
	global_position = global_position + knockback

func _on_Secret2Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_secret(2)

func _on_Secret1Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene_secret(1)


func _on_Randomteleporter3_body_entered(body):
	pass # Replace with function body.
