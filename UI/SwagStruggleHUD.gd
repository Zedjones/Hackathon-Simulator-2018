extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var time

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	time = 60

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	time -= 1
	$Time.text = str(time)
