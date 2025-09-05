extends Node2D


func _ready():
	$Player/CharacterBody2D.connect("game_ended", _game_over)
	$HighScore.text = "Best: " + str(Stats.high_score)


func _game_over():
	$ObstacleSpawner.game_over = true
	$ObstacleSpawner/Timer.stop()
