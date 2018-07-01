extends KinematicBody

var speed = 5
var direction = Vector3()
var manager
var length = 1
var current_pos
var spawnable = true
var player
var point_givable = true

func adjust_length():
	var extra_plats = randi()%3+1
	for i in extra_plats:
		var piece = preload("res://Scenes/PlatformPieceV2.tscn").instance()
		add_child(piece)
		piece.translate(Vector3(0,0, 2 + i))
	length += extra_plats
	print(length)
		
func give_point():
	for child in get_children():
		if child.get("point_givable"):
			child.point_givable = false
	point_givable = false
	manager.score += 1

func _ready():
	manager = get_parent()
	player = manager.get_parent().get_node("Player")
	adjust_length()
	
	pass

func _process(delta):
	if manager.game_active == true:
		translate(Vector3(0,0, -1 * speed) * delta)
		current_pos = get('translation')
		if current_pos.z < ((length + 3) * -1) and spawnable:
			var jump_dist = range(7,10)[randi()%range(7, 10).size()]
			if jump_dist > 7: 
				if player.inventory.size() > 1:
					pass
				else:
					var coin = preload("res://Jump Coin.tscn").instance()
					coin.translate(Vector3(0, 1000, current_pos.z + length + jump_dist +  (range(7,12)[randi()%range(7, 12).size()] * 200)))
					add_child(coin)
					pass
					
			manager.spawn_platform(Vector3(0, 0, (current_pos.z + length + jump_dist)))
			spawnable = false
			