extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var current_target
var enemies
var frozen 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	
func setup_AI(enemy_list):
	enemies = enemy_list
	current_target = enemy_list[randi() % enemies.size()]
	
func freeze(is_frozen):
	frozen = is_frozen 
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func switch_target():
	current_target = enemy_list[randi() % enemies.size()]