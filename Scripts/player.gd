extends CharacterBody2D


signal game_ended

const SPEED = 300

var GameOverScene = preload("res://Scenes/GameOver.tscn")

var _vertical_speed = 0
var _showing_game_over = false

func _ready():
	position = Vector2(0, 472)

func _process(delta):
	if not _showing_game_over:
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
			
		Stats.set_score(Stats._score + (2*delta))

func _physics_process(_delta):
	var collision = move_and_slide()
	if collision:
		_show_game_over()

func _show_game_over():
	if not _showing_game_over:
		_showing_game_over = true
		game_ended.emit()
		var parent = get_parent().get_parent().get_parent()
		var game_over = GameOverScene.instantiate() as Node2D
		parent.add_child(game_over)
