extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var SPEED
var direction = Vector2()
var screensize

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$MoveLoop.start()
	screensize = get_viewport_rect().size
	randomize()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _process(delta):
	position += direction * SPEED * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func _on_MoveLoop_timeout():
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
	$MoveTime.start()

func _on_MoveTime_timeout():
	direction = Vector2(0, 0)