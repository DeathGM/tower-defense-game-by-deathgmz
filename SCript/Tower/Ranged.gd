extends Area2D


var mobs = []
func _on_Ranged_area_entered(area):
	if area.is_in_group("mobs"):
		mobs.append(area.get_parent())
	pass # Replace with function body.


func _on_Ranged_area_exited(area):
	if area.is_in_group("mobs"):
		mobs.erase(area.get_parent())
	pass # Replace with function body.
func get_closest_enemy():
	var enemies = get_overlapping_areas()
	if enemies.empty(): return null
	var distances = []
	for enemy in enemies:
		var distance = self.global_position.distance_squared_to(enemy.global_position)
		distances.append(distance)
	var min_distance = distances.min()
	var min_index = distances.find(min_distance)
	var closest_enemy = enemies[min_index]
	return closest_enemy
