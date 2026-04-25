extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("/root/Game/Ysortedthings/player").health<=0:
		get_node("/root/Game/Ysortedthings/player").health=0
		get_node("/root/Game/Ysortedthings/player").modulate=Color(0.8,0.8,0.8,0.4)
		get_node("/root/Game/Ysortedthings/player").movetype="Stop"
	scale.x=0.125*get_node("/root/Game/Ysortedthings/player").health
