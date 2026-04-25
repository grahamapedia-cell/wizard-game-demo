extends Node2D
func _process(delta: float) -> void:
	self.global_position=get_node("/root/Game/Ysortedthings/player").global_position
