extends Area2D

export var speed = 350
export var steer_force = 50.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null

var damage = 20
func start(_transform, _target):
	global_transform = _transform
	velocity = transform.x * speed
	target = _target
	
func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.global_position - global_position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer
	
func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta
	
func destroy():
	$AnimationPlayer.play("destroy")
	yield($AnimationPlayer,"animation_finished")
	queue_free()


func _on_Missile_area_entered(area):
	if area.is_in_group("Mobs"):
		destroy()
		area.health -= damage
		set_physics_process(false)
	pass # Replace with function body.


func _on_lifetime_timeout():
	queue_free()
	pass # Replace with function body.
