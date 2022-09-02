extends Node2D

onready var bottom_portal = get_node("Portals/Bottom_Portal")
onready var right_portal = get_node("Portals/Right_Portal")
onready var player_model = get_node("/root/PlayerModel")

func _ready():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/Tiles/BluePortal.png")
	texture.create_from_image(image)
	bottom_portal.set_texture(texture)
	if player_model.explored_up_to >= 10:
		right_portal.set_texture(texture)
