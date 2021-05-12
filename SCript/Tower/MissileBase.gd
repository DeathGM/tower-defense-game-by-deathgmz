extends StaticBody2D
var can_shoot = true
var can_shoot2 = true
var missile = load("res://Sence/Misc/Missile.tscn")

func _physics_process(delta):
	
	if $Area2D.get_closest_enemy():
		shoot1()
		shoot2()
	pass


func shoot1():
	if can_shoot:
		var m = missile.instance()
		get_parent().add_child(m)
		m.start($pos1.global_transform, $Area2D.get_closest_enemy())
		can_shoot = false
		yield(get_tree().create_timer(2.6), "timeout")
		can_shoot = true
func shoot2():
	if can_shoot2:
		var m = missile.instance()
		get_parent().add_child(m)
		m.start($pos2.global_transform, $Area2D.get_closest_enemy())
		can_shoot2 = false
		yield(get_tree().create_timer(4), "timeout")
		can_shoot2 = true
