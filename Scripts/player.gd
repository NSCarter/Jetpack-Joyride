extends CharacterBody2D

const SPEED = 300
var _vertical_speed = 0

func _ready():
	position = Vector2(0, 472)

func _process(delta):
	if position.x < 249:
		position.x += 99.6 * delta
	
	_vertical_speed = -SPEED
	
	if Input.is_action_pressed("rise"):
		_vertical_speed += (SPEED * 2)

	position.y -= _vertical_speed * delta
	
	if position.y > 472:
		position.y = 472
		
	if position.y < 0:
		position.y = 0

func _physics_process(_delta):
	var collision = move_and_slide()
	if collision:
		print("game_over")
