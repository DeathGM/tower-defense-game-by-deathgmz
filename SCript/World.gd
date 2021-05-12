extends Node2D



var mob = load("res://Sence/Mobs/Mobs.tscn")
var mobs_left = 0
var wave = 0
var wave_mobs = [5,10,12,15,15,17,20,25,30,20,30,50]
var dragging = false
func _ready():
	$WaveTime.start()

func _input(event):
	if event is InputEventMouseMotion and dragging:
		$Camera2D.position = get_global_mouse_position()
func _physics_process(delta):
	if Input.is_action_pressed("btn_right"):
		dragging = true
	else:
		dragging = false
	$GUI/Cash.text = str(Global.cash)
func _on_WaveTime_timeout():
	mobs_left = wave_mobs[wave]
	$MobsTime.start()
	pass # Replace with function body.


func _on_MobsTime_timeout():
	var ins = mob.instance()
	$Path2D.add_child(ins)
	mobs_left -= 1
	if mobs_left <= 0:
		wave += 1
		$MobsTime.stop()
		if wave <=len(wave_mobs):
			$WaveTime.start()
	pass # Replace with function body.
