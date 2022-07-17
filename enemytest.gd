extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 2

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.get_global_position()) * speed
	else:
		move = Vector2.ZERO
		
		
	move = move.normalized()
	move = move_and_collide(move)

func _on_Area2D_body_entered(body):
	if body != self:
		player = body
