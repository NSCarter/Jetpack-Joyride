extends Node2D


var ObstacleScene = preload("res://Scenes/Obstacle.tscn")
var game_over = false

var _obstacles = []
var _wait_time = 2.5

#func _ready():
	#_on_spawn_timer_timeout()

func _process(delta):
	if not game_over:
		for obstacle in _obstacles:
			obstacle.position.x -= 500 * delta
			
			if obstacle.position.x < -80:
				_obstacles.remove_at(_obstacles.find(obstacle))
				remove_child(obstacle)
				
				if _wait_time > 0.5:
					_wait_time -= 0.01
					$Timer.wait_time = randf_range(_wait_time, 2.5)


func _on_spawn_timer_timeout():
	var spawn_pos = randi_range(0, 496)
	var obstacle = _create_obstacle(spawn_pos)
	_obstacles.append(obstacle)


func _create_obstacle(spawn_pos):
	var obstacle = ObstacleScene.instantiate() as StaticBody2D
	obstacle.position = Vector2(1152, spawn_pos)
	add_child(obstacle)
	return obstacle
