extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x=0
	get_node("../Dead").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("/root/titlescreen/Game/Ysortedthings/player").health<=0:
		get_node("/root/titlescreen/Game/Ysortedthings/player").health=0
		get_node("../Dead").visible=true
		get_node("/root/titlescreen/Game/Ysortedthings/player").modulate=Color(0.8,0.8,0.8,0.4)
		get_node("/root/titlescreen/Game/Ysortedthings/player").movetype="Stop"
		if Input.is_action_just_pressed("dodge"):
			get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x=0
			get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y=50
			get_node("/root/titlescreen/Game/Ysortedthings/player").health=50
			get_node("../Dead").visible=false
			get_node("/root/titlescreen/Game/Ysortedthings/player").modulate=Color(1,1,1)
			get_node("/root/titlescreen/Game/Ysortedthings/player").movetype="Normal"
			get_node("../Inventory_things").visible=true
	scale.x=0.125*get_node("/root/titlescreen/Game/Ysortedthings/player").health
