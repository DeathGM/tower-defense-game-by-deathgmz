extends StaticBody2D


var bullet = load("res://Sence/Misc/Bullet.tscn")
func _ready():
	$Sprite2.hide()
func _physics_process(delta):
	if $Ranged.get_closest_enemy(): 
		
		var dir:Vector2 = $Ranged.get_closest_enemy().global_position - global_position
		rotation = dir.angle()
		var collider = $RayCast2D.get_collider()
		if collider:
			if $Guntime.time_left <= 0:
				$Guntime.start()
				shoot()
#				var ins = bullet.instance()
#				ins.start_at($ShotPos.position,rotation)
#				add_child(ins)
#				print("shoot")
		#print(collider.name)
func shoot():
	var b_ins = bullet.instance()
	b_ins.start_at($ShotPos.global_position,rotation)
	$AnimationPlayer.play("shoot")
	get_tree().get_root().call_deferred("add_child",b_ins)
