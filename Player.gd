extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()
var in_air
var double_timer = 0
var double_cd = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	direction = direction.normalized()
	direction = direction * speed * delta
	
	velocity.y += gravity * delta
	
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
		
	var collision = move_and_collide(velocity * delta)
	
	# Detects floor for jumps. Controls state for double jump.
	if collision:
		in_air = false
		
		if Input.is_action_just_pressed('ui_up'):
			velocity.y = 10
			in_air = true
				
	elif Input.is_action_just_pressed('ui_up') and in_air:
		if double_timer <= 0:
			if velocity.y < 3:
				velocity.y = 5
			else:
				velocity.y  += 5
			double_timer = double_cd
			get_node("../Game Manager/Double").hide()

	# Subtracts from double jump cool down each frame.
	if double_timer > 0:
		double_timer -= 1
	else:
		get_node("../Game Manager/Double").show()