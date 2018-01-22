extends Area2D

var velocity = 100
var rotation = 0
var life = 4

func _ready():
	add_to_group(game.ENEMY_GROUP)
	randomize()
	set_process(true)
	rotation = rand_range(-2, 2)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0, 1) * velocity * delta)
	rotate(rotation * delta)
	pass
	
func apply_damage(value):
	get_node("anim").play("hit")
	life -= value
	if life <= 0:
		remove_from_group(game.ENEMY_GROUP)
		get_node("anim").play("destroy")
		pass
	pass