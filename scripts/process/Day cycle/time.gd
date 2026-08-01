extends Control
var day = 1
var hour = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("DayCycle").modulate=Color(1,0.5,0,0.1) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position=get_node("/root/titlescreen/Game/Ysortedthings/player").global_position
	hour=get_node("../GUI/Daycounter").hoursdone
	if hour<1:
		get_node("DayCycle").modulate=Color(1,0.3,0,0.05)
	elif hour<4:
		get_node("DayCycle").modulate=Color(1,1,1,0)
	elif hour<9:
		get_node("DayCycle").modulate=Color(1,1,1,0.05)
	elif hour<11:
		get_node("DayCycle").modulate=Color(1,1,1,0)
	elif hour<13:
		get_node("DayCycle").modulate=Color(1,0.3,0,0.05)
	elif hour<14:
		get_node("DayCycle").modulate=Color(0.2,0.2,0.4,0.2)
	elif hour<18:
		get_node("DayCycle").modulate=Color(0.1,0.1,0.2,0.4)
	else:
		get_node("DayCycle").modulate=Color(0.1,0.1,0.2,0.6)
	if get_node("../Area").area=="/root/titlescreen/Game/Ysortedthings/Inside":
		get_node("DayCycle").modulate=Color(1,1,1,0)

func save():
	print("time")
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x":position.x,
		"pos_y":position.y,
		"day": day,
		"hour": hour
		}
	return save_dict
