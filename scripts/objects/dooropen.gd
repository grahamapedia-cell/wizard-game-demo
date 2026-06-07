extends Area2D
var open=false
var lastopen=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../..").visible==false:
		get_node("Dooropen").set_deferred("disabled", true)
	else:
		get_node("Dooropen").set_deferred("disabled", false)
	if abs(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x-self.global_position.x)<=16:
		if abs(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y)<=16:
			self.visible=false
			open=true
			if abs(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y)<=8:
				if get_node("/root/titlescreen/Game/World/Area").area_time==false and get_node("../..").visible==true:
					get_node("/root/titlescreen/Game/World/Area").area_time=true
					get_node("/root/titlescreen/Game/World/Area").leaving="Outside"
					get_node("/root/titlescreen/Game/World/Area").entering="Inside"
					get_node("/root/titlescreen/Game/World/Area").xpos=0
					get_node("/root/titlescreen/Game/World/Area").ypos=50
					print("rood")
		else:
			self.visible=true
			open=false
	else:
		self.visible=true
		open=false
	if lastopen!=open and get_node("../..").visible==true:
		if open==false:
			get_node("Open").stop()
			get_node("Close").play()
		else:
			get_node("Close").stop()
			get_node("Open").play()
	lastopen=open
