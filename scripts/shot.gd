extends Area2D

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

func _on_shot_area_enter(area):
	if area.is_in_group(game.ENEMY_GROUP):
		if area.has_method("apply_damage"):
			area.apply_damage(1)
		else:
			area.queue_free()
		pass
	pass
