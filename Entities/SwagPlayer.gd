extends KinematicBody2D

export (int) var SPEED
var screensize

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screensize = get_viewport_rect().size
	randomize()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y)
	move_and_slide(velocity)
	
func get_type():
	return "SwagPlayer"