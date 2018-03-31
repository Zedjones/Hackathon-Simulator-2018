extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player_gender

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	player_gender = "male"
	
func update_gender(gender):
	player_gender = gender 

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
