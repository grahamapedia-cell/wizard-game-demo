extends Node2D
func _process(delta: float) -> void:
	self.global_position=get_node("/root/titlescreen/Game/Ysortedthings/player").global_position
