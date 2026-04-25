extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("..").tiletype=="deco":
		show()
		self.frame=randi_range(0,3)
		self.modulate=get_node("..").color
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
