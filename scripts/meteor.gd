extends Node2D

var velocity = 250
var rotation = 0

func _ready():
	randomize()
	set_process(true)
	rotation = rand_range(-2, 2)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0, 1) * velocity * delta)
	rotate(rotation * delta)
	pass