extends Spatial

# class member variables go here, for example:
var game_active

func _ready():
	game_active = true
	$GameOver.hide()

func _process(delta):
	if game_active == false:
		$GameOver.show()

