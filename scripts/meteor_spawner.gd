extends Node2D

var before_meteor = preload("res://scenes/meteor.tscn")
var interval = 2

func _ready():
	set_process(true)
	pass

func _process(delta):
	if interval > 0:
		interval -= delta
	else:
		interval = rand_range(0.3, 1)
		var meteor = before_meteor.instance()
		meteor.set_pos(Vector2(rand_range(30, 610), -40))
		get_owner().add_child(meteor)
	pass