extends Node2D

var velocity = 300

func _ready():
	set_process(true)
	pass

func _process(delta):
	var right = 0
	var left = 0
	
	if Input.is_action_pressed("right"):
		right = 1
	
	if Input.is_action_pressed("left"):
		left = -1
	
	if get_pos().x > (640 - 50):
		right = 0
	
	if get_pos().x < (50):
		left = 0
	
	set_pos(get_pos() + (Vector2(velocity, 0) * delta * (right + left)))
	pass