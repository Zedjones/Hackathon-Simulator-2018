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
var cooldown

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	enemies = []
	id = 2
	set_physics_process(true)
	randomize()
	cooldown = false 

func _process(delta):
	if current_target == null:
		if not cooldown:
			for enemy in enemies:
				if enemy == $".":
					continue
				var distance = position.distance_to(enemy.position)
				#print("Distance to " + str(enemy.get_type()) + "is " + str(distance))
				if distance <= RANGE:
					current_target = enemy 
					var temp_dir = (current_target.position - $".".position).normalized()
					if temp_dir.x > temp_dir.y:
						temp_dir.y = 0
					else:
						temp_dir.x = 0
					#print("Temp dir" + str(temp_dir))
					direction = temp_dir
	else:
		var temp_dir = (current_target.position - $".".position).normalized()
		if temp_dir.x > temp_dir.y:
			temp_dir.y = 0
		else:
			temp_dir.x = 0
		direction = temp_dir
	move_and_collide(direction*SPEED*delta)
	
func setup_AI(enemy_list, ident):
	enemies = enemy_list
	"""
	current_target = enemies[randi() % enemies.size()]
	while(current_target == $"."):
		current_target = enemies[randi() % enemies.size()]
	var temp_dir = (current_target.position - $".".position).normalized()
	if temp_dir.x > temp_dir.y:
		temp_dir.x = 0
	else:
		temp_dir.y = 0
	"""
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

func switch_target():
	"""
	#print("switching targets")
	var prev_target = current_target
	var own_node = $"."
	while(current_target == prev_target or current_target == own_node):
		#print(current_target)
		current_target = enemies[randi() % enemies.size()]
		#print(current_target)
	"""
	"""
	var temp_dir = (current_target.position - $".".position).normalized()
	if temp_dir.x > temp_dir.y:
		temp_dir.x = 0
	else:
		temp_dir.y = 0
	direction = temp_dir
	#print(direction)
	"""
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
	if body.get_type().find("Walls") != -1:
		print("Switching from wall")
		if direction.x == 0:
			direction.y = -1*direction.y
		else:
			direction.x = -1*direction.x
		current_target = null
		$TargetCooldown.start()
	else:
		print(body.get_type())

func disable_cooldown():
	cooldown = false 

func _on_Area2D_area_entered(area):
	if area == $Area2D:
		return 
	cooldown = true
	print(direction)
	if direction.x == 0:
		direction.y = -1*direction.y
	else:
		direction.x = -1*direction.x
	current_target = null
	print("Switching target") 
	$TargetCooldown.start()