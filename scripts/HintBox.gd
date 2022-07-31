extends MarginContainer
onready var hint_box = get_node("Dialog")
onready var hint_label = get_node("Label")
onready var toggled: bool = false
onready var dialog_texture = preload("res://assets/UI/popup3.png")
onready var player_model = get_node("/root/PlayerModel")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("hint"):
		print("hint toggled")
		
		if toggled:
			toggled = !toggled
			hint_label.set_text("")
			hint_box.set_texture(null)
		else:
			toggled = !toggled
			hint_box.set_texture(dialog_texture)
			var text = ""
			if player_model.in_danger:
				text = "RUN!"
			else:
				text = "You are " + player_model.screens_away as String + " screens away"
			hint_label.set_text(text)
