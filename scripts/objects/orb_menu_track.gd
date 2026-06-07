extends AudioStreamPlayer2D
var OrbOpen=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume_linear=0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../..").visible==true and self.playing==false and get_node("/root/titlescreen/Game/World/Area").opaque>2:
		self.playing=true
	if get_node("../..").visible==false and self.playing==true:
		stop()
	if OrbOpen==true and volume_linear<1:
		volume_linear+=0.1
	if OrbOpen==false and volume_linear>0:
		if volume_linear<=0.1:
			volume_linear=0
		else:
			volume_linear-=0.1
