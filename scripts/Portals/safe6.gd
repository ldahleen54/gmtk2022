extends Node2D

onready var right_portal = get_node("Portals/Right_Portal")
onready var left_portal = get_node("Portals/Left_Portal")
onready var player_model = get_node("/root/PlayerModel")

func _ready():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/Tiles/BluePortal.png")
	texture.create_from_image(image)
	right_portal.set_texture(texture)
	if player_model.explored_up_to >= 7:
		left_portal.set_texture(texture)
