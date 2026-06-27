extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("/root/titlescreen/Game/Ysortedthings/player").health<=0:
		self.visible=false
	#self.global_position=get_node("/root/titlescreen/Game/Ysortedthings/player").global_position
