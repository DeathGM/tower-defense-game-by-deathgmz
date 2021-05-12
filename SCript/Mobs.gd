extends PathFollow2D

var speed = 50
func _physics_process(delta):
	offset += speed * delta

	if unit_offset >= 1:
		queue_free()
