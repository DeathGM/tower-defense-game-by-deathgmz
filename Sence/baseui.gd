extends Control
var mouse_in_tower: bool = false
var mouse_in:bool = false
var has_tower:bool = false
var tower1 = load("res://Sence/Tower/Gun.tscn")
var tower2 = load("res://Sence/Tower/MissileBase.tscn")
func _input(event):
	if event is InputEventMouseButton and mouse_in_tower == false and has_tower == false:
		if mouse_in:
			if event.is_action_pressed("btn_left"):
				$"1".show()
				$"2".show()
		else:
			$"1".hide()
			$"2".hide()
func noice():
	Global.noice.text = "You Don't Have Enough Money To Build"
	yield(get_tree().create_timer(4), "timeout")
	Global.noice.text = ""
	pass
# Check Nhan Phim\

func _on_1_pressed():
	if Global.cash >= 50 and has_tower == false:
		add_tower(1)
		Global.subtract_cash(50)
		has_tower = true
	else:
		noice()
	mouse_in_tower = false
	$"1".hide()
	$"2".hide()
	
func _on_2_pressed():
	print("2")
	if Global.cash >= 100 and has_tower == false:
		add_tower(2)
		Global.subtract_cash(100)
		has_tower = true
	else:
		noice()
	mouse_in_tower = false
	$"1".hide()
	$"2".hide()
	
# Add Tower
func add_tower(which:int):
	var ins
	if which == 1:
		ins = tower1.instance()
	elif which == 2:
		ins = tower2.instance()
	ins.global_position = get_parent().get_node("Guncontai").position
	get_parent().get_node("Guncontai").add_child(ins)

	pass
# Check Entered and Exit
func _on_ui_mouse_entered():
	mouse_in = true
	pass # Replace with function body.


func _on_ui_mouse_exited():
	mouse_in = false
	pass # Replace with function body.


func _on_1_mouse_entered():
	
	mouse_in_tower = true
	pass # Replace with function body.


func _on_1_mouse_exited():
	mouse_in_tower = false
	pass # Replace with function body.


func _on_2_mouse_entered():
	mouse_in_tower = true
	pass # Replace with function body.


func _on_2_mouse_exited():
	mouse_in_tower = false
	pass # Replace with function body.
