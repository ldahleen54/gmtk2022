extends Node2D

onready var bottom_portal = get_node("Portals/Bottom_Portal")
onready var top_portal = get_node("Portals/Top_Portal")
onready var player_model = get_node("/root/PlayerModel")

func _ready():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/Tiles/BluePortal.png")
	texture.create_from_image(image)
	bottom_portal.set_texture(texture)
	if player_model.explored_up_to >= 9:
		top_portal.set_texture(texture)
