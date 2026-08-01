extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null("../../Inventory")!=null:
		self.visible = get_node("../Inventory").visible
