extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var diff_x
var diff_y
var diff_x_coll
var diff_y_coll

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	diff_x = $"../PlayerSprite".position.x - $BackpackSprite.position.x
	diff_x_coll = $"../PlayerSprite".position.x - $BackpackCollision.position.x
	#print(diff_x)
	diff_y = $"../PlayerSprite".position.y - $BackpackSprite.position.y
	diff_y_coll = $"../PlayerSprite".position.y - $BackpackSprite.position.y
	#print(diff_y)

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
	var new_x = diff_x + $"../PlayerSprite".position.x
	var new_y = diff_y + $"../PlayerSprite".position.y
	var new_x_coll = diff_x_coll
	var new_y_coll = diff_y_coll
	if(velocity.x == -1):
		$BackpackSprite.position.x = new_y 
		$BackpackSprite.position.y = -1*new_x
		$BackpackCollision.position.x = new_y_coll
		$BackpackCollision.position.y = -1*new_x_coll
		return 
	elif(velocity.x == 1):
		$BackpackSprite.position.x = -1*new_y 
		$BackpackSprite.position.y = new_x
		$BackpackCollision.position.x = -1*new_y_coll
		$BackpackCollision.position.y = new_x_coll
		return 
	if(velocity.y == 1):
		$BackpackSprite.position.y = -1*new_y
		$BackpackSprite.position.x = new_x
		$BackpackCollision.position.y = -1*new_y_coll
		$BackpackCollision.position.x = new_x_coll
	elif(velocity.y == -1):
		$BackpackSprite.position.y = new_y
		$BackpackSprite.position.x = new_x 
		$BackpackCollision.position.y = new_y_coll
		$BackpackCollision.position.x = new_x_coll

func _on_Backpack_body_entered(body):
	#print(body.get_type())
	pass
	
func get_type():
	return "backpack"
