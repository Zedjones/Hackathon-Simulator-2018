extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var SPEED
var current_target
var enemies
var frozen 
var id
var player_pos

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	enemies = []
	id = 2

func _process(delta):
	if not enemies.empty():
		var direction = (current_target.position - $".".position).normalized()
		move_and_slide(direction*SPEED)
	
func setup_AI(enemy_list, ident):
	enemies = enemy_list
	current_target = enemies[randi() % enemies.size()]
	id = ident
	
func update_player_pos(player_pos_new):
	player_pos = player_pos_new
	
func freeze(is_frozen):
	frozen = is_frozen 

func switch_target():
	print("switching targets")
	var prev_target = current_target
	while(current_target == prev_target or current_target == $"."):
		current_target = enemies[randi() % enemies.size()]
	print("exiting switch")
	
func get_type():
	return "Swag" + str(id)	