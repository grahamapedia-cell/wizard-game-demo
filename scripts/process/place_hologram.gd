extends AnimatedSprite2D
var item
var distx=0
var disty=0
var dist = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	global_position.x=16*floor(mouse_position.x/16)+8
	global_position.y=16*floor(mouse_position.y/16)+8
	item = get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").hotbar[get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Hotbar_Selector").slot]
	distx=global_position.x-16*floor(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x/16)-8
	disty=global_position.y-16*floor(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y/16)-8
	dist=sqrt(pow(distx,2)+pow(disty,2))
	if dist/16>3:
		self.modulate=Color(1,0.5,0.5,.25)
	else:
		self.modulate=Color(1,1,1,.5)
	if item.size()>=2:
		if item[1]=="Essence Extractor":
			offset.y=-8
		else:
			offset.y=0
