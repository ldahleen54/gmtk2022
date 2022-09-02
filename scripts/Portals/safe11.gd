extends Node2D

onready var top_portal = get_node("Portals/Top_Portal")
onready var left_portal = get_node("Portals/Left_Portal")
onready var player_model = get_node("/root/PlayerModel")

func _ready():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/Tiles/BluePortal.png")
	texture.create_from_image(image)
	left_portal.set_texture(texture)
	if player_model.explored_up_to >= 12:
		top_portal.set_texture(texture)
