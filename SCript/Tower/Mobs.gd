extends Area2D

export(String,"1","2","3","4") var mob_type 
var health = 10
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	mob_type = str(rng.randi_range(1,4))
	if mob_type == "1": $Sprite.region_rect = Rect2(960,640,64,64) 
	elif mob_type == "2": $Sprite.region_rect = Rect2(1024,640,64,64)
	elif mob_type == "3": $Sprite.region_rect = Rect2(1088,640,64,64)
	elif mob_type == "4": $Sprite.region_rect = Rect2(1152,640,64,64)
func _physics_process(delta):
	if health <= 0:
		queue_free()
		Global.cash += 20

func _on_Mobs_area_entered(area):
	if area.is_in_group("Bullet") or area.is_in_group("miss"):
		health -= area.damage
		area.destroy()

