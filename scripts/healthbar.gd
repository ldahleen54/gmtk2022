extends HBoxContainer
var blood_texture = preload("res://assets/UI/BloodDrop.png")
onready var blood_node1 = get_node("BloodDrop1")
onready var blood_node2 = get_node("BloodDrop2")
onready var blood_node3 = get_node("BloodDrop3")
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_model = get_node("/root/PlayerModel")
	var blood1 = TextureRect.new()
	var blood2 = TextureRect.new()
	var blood3 = TextureRect.new()
	# check the player health and add the blood drops to the overlay
	if player_model.health == 6:
		blood_node1.set_texture(blood_texture)
		blood_node2.set_texture(blood_texture)
		blood_node3.set_texture(blood_texture)
	
	if player_model.health == 4:
		blood_node1.set_texture(blood_texture)
		blood_node2.set_texture(blood_texture)
	
	if player_model.health == 2:
		blood_node1.set_texture(blood_texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
