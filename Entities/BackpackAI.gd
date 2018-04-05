extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var diff_x
var diff_y
var diff_x_coll
var diff_y_coll
var prev_pos 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	diff_x = $"../SwagSprite".position.x - $BackpackSprite.position.x
	diff_x_coll = $"../SwagSprite".position.x - $BackpackCollision.position.x
	#print(diff_x)
	diff_y = $"../SwagSprite".position.y - $BackpackSprite.position.y
	diff_y_coll = $"../SwagSprite".position.y - $BackpackSprite.position.y
	#print(diff_y)
	prev_pos = get_node("..").position
	print("Swag ai")
	
func _process(delta):
	var velocity = Vector2()
	var pos_diff = $"..".get_direction()
	if($"..".is_frozen()):
		return
	if(pos_diff.x < 0):
		velocity.x -= 1
	elif(pos_diff.x > 0):
		velocity.x += 1
	if(pos_diff.y > 0):
		velocity.y += 1
	elif(pos_diff.y < 0):
		velocity.y -= 1
	if(velocity.x == -1):
		$BackpackSprite.position.x = diff_y 
		$BackpackSprite.position.y = -1*diff_x
		$BackpackCollision.position.x = diff_y_coll
		$BackpackCollision.position.y = -1*diff_x_coll
	elif(velocity.x == 1):
		$BackpackSprite.position.x = -1*diff_y 
		$BackpackSprite.position.y = diff_x
		$BackpackCollision.position.x = -1*diff_y_coll
		$BackpackCollision.position.y = diff_x_coll
	if(velocity.y == 1):
		$BackpackSprite.position.y = -1*diff_y
		$BackpackSprite.position.x = diff_x
		$BackpackCollision.position.y = -1*diff_y_coll
		$BackpackCollision.position.x = diff_x_coll
	elif(velocity.y == -1):
		$BackpackSprite.position.y = diff_y
		$BackpackSprite.position.x = diff_x 
		$BackpackCollision.position.y = diff_y_coll
		$BackpackCollision.position.x = diff_x_coll

func get_type():
	return "backpack"

func _on_BackpackAI_body_entered(body):
	if(body.get_type().find("Swag") != -1 and body != $".."):
		if $"..".is_frozen() or body.is_frozen() or body.get_invincible():
			return
		print("Collided with backpack " + str($"..".get_id()))
		print(body.get_type())
		body.freeze(true)
		body.start_freeze_timer()
		$"..".freeze(true)
		$"../FreezeTimer".start()
		if $"..".get_score() == 0:
			return
		$"..".change_score(-1)
		body.change_score(1)

func _on_BackpackAI_area_entered(area):
	pass
