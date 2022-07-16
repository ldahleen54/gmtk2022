extends KinematicBody2D
export (int) var speed = 200

var velocity = Vector2()

const scenes = [
	"res://scenes/area1.tscn",
	"res://scenes/area2.tscn",
	"res://scenes/area3.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_model = get_node("/root/PlayerModel")
	print(player_model.health)
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
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
func _on_1Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene(1)
	
func _on_2Teleporter_body_entered(body):
	print("tele 2 collision")
	if body.name == "PlayerBody":
		change_scene(2)

func _on_3Teleporter_body_entered(body):
	if body.name == "PlayerBody":
		change_scene(3)

func _on_RandomTeleporter_body_entered(body):
	var sceneNumber = rand_range(0, len(scenes) + 1) as int
	if body.name == "PlayerBody":
		change_scene(sceneNumber)
	
func change_scene(sceneNumber):
	var scene = "res://scenes/area" + sceneNumber as String + ".tscn"
	get_tree().change_scene(scene)

func _on_Area2D_body_entered(body):
	var player_model = get_node("/root/PlayerModel")
	player_model.health = player_model.health - 1
