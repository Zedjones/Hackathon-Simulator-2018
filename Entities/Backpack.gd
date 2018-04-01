extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var diff_x
var diff_y

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	diff_x = $"../PlayerSprite".position.x - $BackpackSprite.position.x
	print(diff_x)
	diff_y = $"../PlayerSprite".position.y - $BackpackSprite.position.y
	print(diff_y)

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
	var old_y = $BackpackSprite.position.y 
	var old_x = $BackpackSprite.position.x 
	var new_x = diff_x + $"../PlayerSprite".position.x
	var new_y = diff_y + $"../PlayerSprite".position.y
	print(velocity.x)
	if(velocity.x == -1):
		print("flipping right")
		$BackpackSprite.position.x = new_y 
		$BackpackSprite.position.y = -1*new_x
		return 
	elif(velocity.x == 1):
		$BackpackSprite.position.x = -1*new_y 
		$BackpackSprite.position.y = new_x
		return 
	if(velocity.y == 1):
		$BackpackSprite.position.y = -1*new_y
		$BackpackSprite.position.x = new_x
	if(velocity.y == -1):
		$BackpackSprite.position.y = new_y
		$BackpackSprite.position.x = new_x 