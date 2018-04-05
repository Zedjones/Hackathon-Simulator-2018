extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var players

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	players = []
	players.append($"SwagPlayer")
	players.append($"SwagAI1")
	players.append($"SwagAI2")
	players.append($"SwagAI3")
	$"SwagAI1".setup_AI(players, 2)
	$"SwagAI2".setup_AI(players, 3)
	$"SwagAI3".setup_AI(players, 4)
	randomize()
	
func _process(delta):
	$SwagStruggleHUD/PlayerOneScore.text = str($SwagPlayer.get_score())
	$SwagStruggleHUD/PlayerTwoScore.text = str($SwagAI1.get_score())
	$SwagStruggleHUD/PlayerThreeScore.text = str($SwagAI2.get_score())
	$SwagStruggleHUD/PlayerFourScore.text = str($SwagAI3.get_score())