extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../..").visible==true and self.playing==false and get_node("/root/titlescreen/Game/World/Area").opaque>2:
		self.playing=true
	if get_node("../..").visible==false and self.playing==true:
		stop()
