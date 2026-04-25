extends Node2D
var lastframe=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lastframe=get_node("../AnimatedSprite2D").frame # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../AnimatedSprite2D").frame!=lastframe:
		lastframe=get_node("../AnimatedSprite2D").frame
		if get_node("/root/Game/Ysortedthings/Inside").visible==true:
			get_node("Wood").pitch_scale=randf_range(0.5,1.5)
			get_node("Wood").play(1)
		else:
			get_node("Grass").pitch_scale=randf_range(1,1.5)
			get_node("Grass").play(1)
