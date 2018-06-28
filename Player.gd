extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()


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
	
	# Detects floor for jumps.
	if collision:
		var collider = collision.get_collider()
		if Input.is_action_just_pressed('ui_up'):
			velocity.y = 10
