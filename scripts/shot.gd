extends Node2D

var velocity = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0, -1) * velocity * delta)
	
	if get_pos().y < -30:
		queue_free()
		pass
	
	pass