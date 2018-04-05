extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var SPEED
var score
var current_target
var enemies
var frozen 
var id = 0
var direction 
var cooldown
var invincible 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	enemies = []
	id = 2
	randomize()
	cooldown = false 
	score = 10

func _process(delta):
	if not frozen:
		move_and_collide(direction*SPEED*delta)
	
func setup_AI(enemy_list, ident):
	enemies = enemy_list
	var d = randi() % 4
	match d:
		0:
			direction = Vector2(-1, 0)
		1:
			direction = Vector2(1, 0)
		2:
			direction = Vector2(0, 1)
		3:
			direction = Vector2(0, -1)
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
	
func is_frozen():
	return frozen

func switch_target():
	var d = randi() % 4
	match d:
		0:
			direction = Vector2(-1, 0)
		1:
			direction = Vector2(1, 0)
		2:
			direction = Vector2(0, 1)
		3:
			direction = Vector2(0, -1) 
	current_target = null 
	
func get_type():
	return "Swag" + str(id)	

func _on_Area2D_body_entered(body):
	if body == $".":
		return 
	if body.get_type() == "TopWall" or body.get_type() == "SideWall":
		if direction.x == 0:
			direction.y = -1*direction.y
		else:
			direction.x = -1*direction.x
		current_target = null
		$TargetCooldown.start()

func disable_cooldown():
	cooldown = false 

func _on_Area2D_area_entered(area):
	if area == $Area2D:
		return 
	if direction.x == 0:
		direction.y = -1*direction.y
	else:
		direction.x = -1*direction.x
	current_target = null
	#print("Switching target") 
	$TargetCooldown.start()
	
func get_id():
	return id
	
func get_direction():
	return direction
	
func start_freeze_timer():
	$FreezeTimer.start()

func _on_FreezeTimer_timeout():
	frozen = false 
	invincible = true 
	$StealCooldown.start()

func change_score(delta):
	score += delta 
	
func get_score():
	return score
	
func set_invincible(set_invincible):
	invincible = set_invincible
	
func get_invincible():
	return invincible

func _on_StealCooldown_timeout():
	invincible = false 
