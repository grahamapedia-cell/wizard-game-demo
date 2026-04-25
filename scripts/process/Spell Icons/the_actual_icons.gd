extends AnimatedSprite2D
var page

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	page = get_node("..").page
	if self.sprite_frames.get_animation_names().has(get_node("..").spell)==true:
		self.visible=true
		self.animation=get_node("..").spell
	else:
		self.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../..").killswitch==true:
		if page==0:
			get_node("../..").iconshere[0]=""
		else:
			get_node("../..").iconshere[1]=""
		get_node("../..").killswitch=false
		queue_free()
