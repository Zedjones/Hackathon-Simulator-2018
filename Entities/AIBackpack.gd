extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var diff_x
var diff_y
var diff_x_coll
var diff_y_coll
#var velocity_change = Vector2()
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
	set_physics_process(true)
	prev_pos = $"../SwagSprite".position
	
"""
func _physics_process(delta):
	velocity_change = $"../SwagSprite".position - prev_pos
	prev_pos = $"../SwagSprite".position
	print(velocity_change)

func _process(delta):
	var velocity = velocity_change
	#print(velocity)
	var new_x = diff_x + $"../SwagSprite".position.x
	var new_y = diff_y + $"../SwagSprite".position.y
	var new_x_coll = diff_x_coll + $"../SwagSprite".position.x
	var new_y_coll = diff_y_coll + $"../SwagSprite".position.y
	if(velocity.x <= -1):
		$BackpackSprite.position.x = new_y 
		$BackpackSprite.position.y = -1*new_x
		$BackpackCollision.position.x = new_y_coll
		$BackpackCollision.position.y = -1*new_x_coll
		return 
	elif(velocity.x >= 1):
		$BackpackSprite.position.x = -1*new_y 
		$BackpackSprite.position.y = new_x
		$BackpackCollision.position.x = -1*new_y_coll
		$BackpackCollision.position.y = new_x_coll
		return 
	if(velocity.y >= 1):
		$BackpackSprite.position.y = -1*new_y
		$BackpackSprite.position.x = new_x
		$BackpackCollision.position.y = -1*new_y_coll
		$BackpackCollision.position.x = new_x_coll
	if(velocity.y <= -1):
		$BackpackSprite.position.y = new_y
		$BackpackSprite.position.x = new_x 
		$BackpackCollision.position.y = new_y_coll
		$BackpackCollision.position.x = new_x_coll
"""

func _on_Backpack_body_entered(body):
	print(body.get_type())
