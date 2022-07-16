extends HBoxContainer
# sets the state to detect if something has changed
var state = {
	"health": 0
}

var blood_texture = preload("res://assets/UI/BloodDrop.png")
onready var blood_node1 = get_node("BloodDrop1")
onready var blood_node2 = get_node("BloodDrop2")
onready var blood_node3 = get_node("BloodDrop3")
onready var player_model = get_node("/root/PlayerModel")

func change_health():
	state.health = player_model.health
	print("health has changed to: ", state.health)
	if state.health == 6:
		blood_node1.set_texture(blood_texture)
		blood_node2.set_texture(blood_texture)
		blood_node3.set_texture(blood_texture)
	
	if state.health == 4:
		blood_node1.set_texture(blood_texture)
		blood_node2.set_texture(blood_texture)
		blood_node3.set_texture(null)
	
	if state.health == 2:
		blood_node1.set_texture(blood_texture)
		blood_node2.set_texture(null)
		blood_node3.set_texture(null)

func _ready():
	state.health = player_model.health
	var blood1 = TextureRect.new()
	var blood2 = TextureRect.new()
	var blood3 = TextureRect.new()
	# check the player health and add the blood drops to the overlay
	change_health()

func _process(delta):
	# check for state change
	if player_model.health != state.health:
		state.health = player_model.health
		change_health()
