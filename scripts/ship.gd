extends Node2D

var before_shot = preload("res://scenes/shot.tscn")
var velocity = 300
var interval = .3
var last_shot = 0

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
	
	set_pos(get_pos() + (Vector2(1, 0) * velocity * delta * (right + left)))
	
	# dispatch
	if Input.is_action_pressed("shot"):
		if last_shot <= 0:
			shot(get_node("left_cannon"))
			shot(get_node("right_cannon"))
			last_shot = interval
		pass
	
	if last_shot > 0:
		last_shot -= delta
	pass
	
func shot(node):
	var shot_cannon_left = before_shot.instance()
	shot_cannon_left.set_global_pos(node.get_global_pos())
	get_owner().add_child(shot_cannon_left)
	pass