extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (PackedScene) var MAIN_GAME

signal male 
signal female

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Male_pressed():
	GlobalData.update_gender("male")
	get_tree().change_scene("res://Scenes/MainFloor/Main.tscn")

func _on_Female_pressed():
	GlobalData.update_gender("female")
	get_tree().change_scene("res://Scenes/MainFloor/Main.tscn")