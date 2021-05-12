extends Area2D

var vel = Vector2.ZERO
var speed = 1000
var damage = 2
func _process(delta):
	global_position += vel * delta
func start_at(pos,dir):
	
	global_rotation = dir
	global_position = pos
	vel = Vector2(speed, 0).rotated(dir)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
func destroy():
	
	queue_free()
