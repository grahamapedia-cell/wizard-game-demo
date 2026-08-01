extends Node2D
func _process(delta: float) -> void:
	if get_node_or_null("/root/titlescreen/Game/Ysortedthings/player")!=null:
		self.global_position=get_node("/root/titlescreen/Game/Ysortedthings/player").global_position
