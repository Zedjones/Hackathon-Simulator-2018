extends Area2D

export (int) var SPEED
var screensize

var facing = Vector2(1, 0)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screensize = get_viewport_rect().size

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _process(delta):
	var direction_change = get_input_delta()
	update_facing(direction_change)
	update_pos(direction_change)
	
	
func get_input_delta():
	var direction_change = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction_change.x += 1
	if Input.is_action_pressed("ui_left"):
		direction_change.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction_change.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction_change.y += 1
	return direction_change
	
func update_facing(dir_change):
	if dir_change.x == 0 and dir_change.y == 0:
		return
	facing = dir_change
	
func update_pos(dir_change):
	position += dir_change.normalized() * SPEED