extends KinematicBody2D

export (int) var speed = 200

# Declare member variables here. Examples:
var _up
var _down

onready var _screen_size_y = get_viewport_rect().size.y

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
