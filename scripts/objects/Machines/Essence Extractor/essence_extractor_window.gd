extends Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("../..").machine=="Essence Extractor":
		show()
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Progress Arrow").visible=get_node(get_node("../..").path).arrowon
	get_node("Progress Arrow").frame=get_node(get_node("../..").path).windowarrow
	if get_node("../../../Inventory").visible==false:
		hide()
		queue_free()
	
