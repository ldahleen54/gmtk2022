extends KinematicBody2D

export (int) var speed = 200

# Declare member variables here. Examples:
var _up
var _down

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	var n = String(name).to_lower()
	pass

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
	
func _on_LeftTeleporter_body_entered(body):
	if body.name == "PlayerBody":
		get_tree().change_scene("res://scene2.tscn")


func _on_RightTeleporter_body_entered(body):
	print("right teleporter collision")
	if body.name == "PlayerBody":
		get_tree().change_scene("res://scene1.tscn")
