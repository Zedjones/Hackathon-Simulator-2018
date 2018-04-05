extends KinematicBody2D

export (int) var SPEED
var screensize 
var frozen
var score 
var invincible 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screensize = get_viewport_rect().size
	score = 10
	randomize()

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
	if not frozen:
		move_and_slide(velocity)
	
func get_type():
	return "SwagPlayer"
	
func start_freeze_timer():
	$FreezeTimer.start()
	
func freeze(to_freeze):
	frozen = to_freeze 
	
func is_frozen():
	return frozen 

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
