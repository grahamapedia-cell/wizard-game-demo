extends Area2D
@export var type = ""
@export var title = 0
@export var amount: PackedScene
@export var killswitch = false
var equipped = false
#offset: 7.5,6.5
var num

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_pickable=false
	if 1==1:
		if self.name=="Charm1":
			type = "Charm"
			title = 0
		if self.name=="Charm2":
			type = "Charm"
			title = 1
		if self.name=="Charm3":
			type = "Charm"
			title = 2
		if self.name=="Ring1":
			type = "Ring"
			title = 0
		if self.name=="Ring2":
			type = "Ring"
			title = 1
		if self.name=="Hat":
			type = "Hat"
			title = 0
		if self.name=="Robes":
			type = "Robes"
			title = 0
		if self.name=="SpellbookSlot":
			type="Spellbook"
			title=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null("../../Inventory")!=null:
		self.input_pickable=get_node("../../Inventory").visible
	self.visible = self.input_pickable
	if type == "Spellbook" and get_node_or_null("../../Inventory")!=null:
		if get_node("../../Inventory").spellbookfull==false:
			get_node("./AnimatedSprite2D").animation = "empty"
			get_node("./AnimatedSprite2D").modulate = Color(1,1,1)
			get_node("./Alphaless").animation = "empty"
		else:
			get_node("./AnimatedSprite2D").animation = get_node("../../Inventory").spellbook[2][0]
			get_node("./AnimatedSprite2D").modulate = ColorStruct(get_node("../../Inventory").spellbook[2][1])
			if get_node("../../Inventory").spellbook[2][0]=="Scroll":
				get_node("Alphaless").animation="paper"
			else:
				get_node("./Alphaless").animation = "pages"
		if get_node("Equip").get_playback_position()>=1:
			get_node("Equip").stop()
		if get_node("../../Inventory").spellbookfull!=equipped:
			get_node("Equip").play()
		equipped=get_node("../../Inventory").spellbookfull

func ColorStruct(array):
	if array.size()<4:
		return Color(array[0],array[1],array[2])
	else:
		return Color(array[0],array[1],array[2],array[3])
