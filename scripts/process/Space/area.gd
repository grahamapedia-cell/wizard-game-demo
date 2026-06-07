extends Control
var area_time=true
var opaque = 0
var alwaysloaded = [[-1,1,-1,1]]
var leaving=""
var entering="Outside"
@export var area="/root/Game/Ysortedthings/Outside"
var xpos=0
var ypos=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	opaque=2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if area_time==true:
		if opaque<3:
			opaque+=0.025
		if opaque<1:
			get_node("Fade To Black").modulate=Color(0,0,0,opaque)
		elif opaque>=1 and opaque<1.025:
			get_node("Fade To Black").modulate=Color(0,0,0,1)
			get_node("/root/titlescreen/Game/Ysortedthings/player").movetypestore=get_node("/root/titlescreen/Game/Ysortedthings/player").movetype
			get_node("/root/titlescreen/Game/Ysortedthings/player").movetype="Stop"
			get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x=xpos
			get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y=ypos
			print(get_node("/root/titlescreen/Game/Ysortedthings/"+str(leaving)))
			self.set_deferred("area",str(get_node("/root/titlescreen/Game/Ysortedthings/"+str(entering)).get_path()))
			get_node("/root/titlescreen/Game/Ysortedthings/"+str(leaving)).set_deferred("visible",false)
			get_node("/root/titlescreen/Game/Ysortedthings/"+str(entering)).set_deferred("visible",true)
		elif opaque<=3:
			get_node("Fade To Black").modulate=Color(0,0,0,3-opaque)
		if opaque>=3:
			area_time=false
			get_node("/root/titlescreen/Game/Ysortedthings/player").movetype=get_node("/root/titlescreen/Game/Ysortedthings/player").movetypestore
			opaque=0
