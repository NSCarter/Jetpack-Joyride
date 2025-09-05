extends Node


signal score_changed(score)

var high_score = 0
var save_high_score = false

var _score = 0


func _ready():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	if save_file != null:
		high_score = int(save_file.get_as_text())


func set_score(score):
	_score = score
	score_changed.emit(score)
	
	if score > high_score:
		high_score = score
		save_high_score = true


func get_score():
	return int(_score)
