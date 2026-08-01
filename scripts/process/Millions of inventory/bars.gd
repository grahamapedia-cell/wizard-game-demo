extends Node2D
@export var killswitch = false
@export var type = "Generic"
@export var amount: PackedScene
#offset: 7.5,6.5
var title=0
var num
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if 1==1:
		if self.name=="Bar1":
			title=0
		if self.name=="Bar2":
			title=1
		if self.name=="Bar3":
			title=2
		if self.name=="Bar4":
			title=3
		if self.name=="Bar5":
			title=4
		if self.name=="Bar6":
			title=5
		if self.name=="Bar7":
			title=6
		if self.name=="Bar8":
			title=7
		if self.name=="Bar9":
			title=8
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible=get_node("../../Hotbar").visible
	if get_node_or_null("../../Inventory")!=null:
		if get_node("../../Inventory").hotbar[title].size()>=2:
				if get_node("../../Inventory").hotbar[title][2][0]=="Essence":
					get_node("./AnimatedSprite2D").animation = "Potion"
					get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").hotbar[title][2][1])
					get_node("./Alphaless").animation = "bottle"
				elif get_node("../../Inventory").hotbar[title][2][0]=="Scroll":
					get_node("./AnimatedSprite2D").animation = "Scroll"
					get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").hotbar[title][2][1])
					get_node("./Alphaless").animation = "paper"
				elif get_node("../../Inventory").hotbar[title][2][0]=="Spellbook":
					get_node("./AnimatedSprite2D").animation = "Spellbook"
					get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").hotbar[title][2][1])
					get_node("./Alphaless").animation = "pages"
				elif get_node("../../Inventory").hotbar[title][2][0]=="Seeds":
					get_node("./AnimatedSprite2D").animation = "Seeds"
					get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").hotbar[title][2][1])
					get_node("./Alphaless").animation = "empty"
				elif get_node("./AnimatedSprite2D").sprite_frames.has_animation(get_node("../../Inventory").hotbar[title][1]):
					get_node("./AnimatedSprite2D").animation = get_node("../../Inventory").hotbar[title][1]
					get_node("./Alphaless").animation = "empty"
					get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").hotbar[title][2][1])
		if get_node("../../Inventory").hotbarnumber[title] >= 2:
			killswitch=true
			num = amount.instantiate()
			num.type="Inventory"
			num.position.x=8
			num.position.y=6.5
			num.number=get_node("../../Inventory").hotbarnumber[title]
			add_child(num)
		elif get_node("../../Inventory").hotbarnumber[title]==0:
			get_node("./AnimatedSprite2D").animation = "empty"
			get_node("./Alphaless").animation = "empty"

func ColorStruct(array):
	if array.size()<4:
		return Color(array[0],array[1],array[2])
	else:
		return Color(array[0],array[1],array[2],array[3])
