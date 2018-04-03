extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var SPEED
export (int) var RANGE 
var current_target
var enemies
var frozen 
var id
var direction 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	enemies = []
	id = 2
	set_physics_process(true)
	randomize()

func _process(delta):
	if not enemies.empty():	
		move_and_slide(direction*SPEED)
	
func setup_AI(enemy_list, ident):
	enemies = enemy_list
	current_target = enemies[randi() % enemies.size()]
	while(current_target == $"."):
		current_target = enemies[randi() % enemies.size()]
	direction = (current_target.position - $".".position).normalized()
	id = ident
	match id:
		3:
			$"SwagSprite".region_rect = Rect2(78, 0, 26, 24)
			$"BackpackAI/BackpackSprite".region_rect = Rect2(15, 25, 15, 13)
		4:
			$"SwagSprite".region_rect = Rect2(104, 0, 26, 24)
			$"BackpackAI/BackpackSprite".region_rect = Rect2(45, 25, 15, 13)
	
func freeze(is_frozen):
	frozen = is_frozen 

func switch_target():
	#print("switching targets")
	var prev_target = current_target
	var own_node = $"."
	while(current_target == prev_target or current_target == own_node):
		#print(current_target)
		current_target = enemies[randi() % enemies.size()]
		#print(current_target)
	direction = (current_target.position - $".".position).normalized()
	#print(direction)
	
func get_type():
	return "Swag" + str(id)	