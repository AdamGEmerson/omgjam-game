extends KinematicBody

var speed = 3
var direction = Vector3()
var manager
var length = 1
var current_pos
var spawnable = true

func adjust_length():
	var extra_plats = randi()%3+1
	for i in extra_plats:
		var piece = preload("res://Scenes/PlatformPiece.tscn").instance()
		add_child(piece)
		piece.translate(Vector3(0,0, 1 * i))
	length += extra_plats
		
func _ready():
	manager = get_parent()
	adjust_length()
	print("Length is", length)
	
	pass

func _process(delta):
	if manager.game_active == true:
		translate(Vector3(0,0,-1 * speed) * delta)
		current_pos = get('translation')
		if current_pos.z < ((length + 3) * -1) and spawnable:
			manager.spawn_platform()
			print(current_pos.z)
			spawnable = false
			