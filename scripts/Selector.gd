extends Sprite

var selected_index = 0
var scenes = [
	"res://scenes/safe/start.tscn",
	"res://scenes/credits.tscn"
]
# Called when the node enters the scene tree for the first time.
func _ready():
	set_offset(Vector2(0, -297))
	
func _process(delta):
	if Input.is_action_pressed("ui_down") and selected_index < len(scenes) - 1:
		selected_index = selected_index + 1
		set_offset(Vector2(0, 0))
	if Input.is_action_pressed("ui_up") and selected_index > 0:
		selected_index = selected_index - 1
		set_offset(Vector2(0, -297))
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene(scenes[selected_index])
