extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("../..").machine=="ORB":
		show()
		get_node("/root/titlescreen/Game/Ysortedthings/Inside/InTower/OrbMenuTrack").OrbOpen=true
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../../../Inventory").visible==false:
		hide()
		get_node("/root/titlescreen/Game/Ysortedthings/Inside/InTower/OrbMenuTrack").OrbOpen=false
		queue_free()
