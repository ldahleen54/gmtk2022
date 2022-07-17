extends KinematicBody2D

var speed = 300
var move = Vector2.ZERO
onready var player_model = get_node("/root/PlayerModel")

func _physics_process(delta):
	var velocity = position.direction_to(player_model.position) * speed
	move_and_slide(velocity)
