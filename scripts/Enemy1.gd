extends KinematicBody2D

var speed = 300
var move = Vector2.ZERO
onready var player_model = get_node("/root/PlayerModel")
onready var previous_player_health = player_model.health
onready var velocity = Vector2.ZERO
var cooldown = 0

func _physics_process(delta):
	if cooldown > 0:
		cooldown = cooldown - 1
		return null
	if player_model.health < previous_player_health:
		cooldown = 20
		velocity = Vector2.ZERO
		previous_player_health = player_model.health
	velocity = position.direction_to(player_model.position) * speed
	move_and_slide(velocity)


func _on_Enemy2_body_entered(body):
	pass # Replace with function body.
