extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null("/root/titlescreen/Game/Ysortedthings/player")!=null:
		if abs(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x-self.global_position.x)<=32:
			if get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y<0 and get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y>=-80:
				get_node("./Sprite2D").modulate=Color(1,1,1,0.5)
			else:
				get_node("./Sprite2D").modulate=Color(1,1,1,1)
		else:
			get_node("./Sprite2D").modulate=Color(1,1,1,1)
