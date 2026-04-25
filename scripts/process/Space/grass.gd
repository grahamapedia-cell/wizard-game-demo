extends Sprite2D
@export var deco: PackedScene
var grow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("..").tiletype=="Grass":
		show()
		self.modulate=get_node("..").color
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
