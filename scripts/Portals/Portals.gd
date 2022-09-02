extends Node2D

onready var bottom_portal = get_node("Bottom_Portal")

func _ready():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/Tiles/BluePortal.png")
	texture.create_from_image(image)
	bottom_portal.set_texture(texture)
