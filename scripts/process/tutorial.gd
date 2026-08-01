extends Node2D
var step = 0
#(0,40)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null("/root/titlescreen/Game/Ysortedthings/player")!=null:
		self.global_position = get_node("/root/titlescreen/Game/Ysortedthings/player").global_position
	if step==0:
		if global_position.x==0:
			if global_position.y<40:
				get_node("AnimatedSprite2D").rotation=PI/2
			else:
				get_node("AnimatedSprite2D").rotation=-PI/2
		elif global_position.x>0:
			get_node("AnimatedSprite2D").rotation=PI+atan((global_position.y-40)/(global_position.x))
		else:
			get_node("AnimatedSprite2D").rotation=atan((global_position.y-40)/(global_position.x))
