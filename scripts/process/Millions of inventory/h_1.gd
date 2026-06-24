extends Area2D
@export var amount: PackedScene
@export var type = "Generic"
@export var killswitch = false
#offset: 7.5,6.5
var title=0
var hotbar=false
var num
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_pickable=false
	if 1==1:
		if self.name=="H1":
			title=0
			hotbar=true
		if self.name=="H2":
			title=1
			hotbar=true
		if self.name=="H3":
			title=2
			hotbar=true
		if self.name=="H4":
			title=3
			hotbar=true
		if self.name=="H5":
			title=4
			hotbar=true
		if self.name=="H6":
			title=5
			hotbar=true
		if self.name=="H7":
			title=6
			hotbar=true
		if self.name=="H8":
			title=7
			hotbar=true
		if self.name=="H9":
			title=8
			hotbar=true
		if self.name=="A1":
			title=0
			hotbar=false
		if self.name=="A2":
			title=1
			hotbar=false
		if self.name=="A3":
			title=2
			hotbar=false
		if self.name=="A4":
			title=3
			hotbar=false
		if self.name=="A5":
			title=4
			hotbar=false
		if self.name=="B1":
			title=5
			hotbar=false
		if self.name=="B2":
			title=6
			hotbar=false
		if self.name=="B3":
			title=7
			hotbar=false
		if self.name=="B4":
			title=8
			hotbar=false
		if self.name=="B5":
			title=9
			hotbar=false
		if self.name=="C1":
			title=10
			hotbar=false
		if self.name=="C2":
			title=11
			hotbar=false
		if self.name=="C3":
			title=12
			hotbar=false
		if self.name=="C4":
			title=13
			hotbar=false
		if self.name=="C5":
			title=14
			hotbar=false
		if self.name=="D1":
			title=15
			hotbar=false
		if self.name=="D2":
			title=16
			hotbar=false
		if self.name=="D3":
			title=17
			hotbar=false
		if self.name=="D4":
			title=18
			hotbar=false
		if self.name=="D5":
			title=19
			hotbar=false
		if self.name=="E1":
			title=20
			hotbar=false
		if self.name=="E2":
			title=21
			hotbar=false
		if self.name=="E3":
			title=22
			hotbar=false
		if self.name=="E4":
			title=23
			hotbar=false
		if self.name=="E5":
			title=24
			hotbar=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_inventory"):
		self.input_pickable=get_node("../../Inventory").visible
	self.visible = self.input_pickable
	if hotbar==true:
		if get_node("../../Inventory").hotbar[title].size()>=2:
			if get_node("../../Inventory").hotbar[title][2][0]=="Essence":
				get_node("./AnimatedSprite2D").animation = "Potion"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").hotbar[title][2][1]
				get_node("./Alphaless").animation = "bottle"
			elif get_node("../../Inventory").hotbar[title][2][0]=="Scroll":
				get_node("./AnimatedSprite2D").animation = "Scroll"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").hotbar[title][2][1]
				get_node("./Alphaless").animation = "paper"
			elif get_node("../../Inventory").hotbar[title][2][0]=="Spellbook":
				get_node("./AnimatedSprite2D").animation = "Spellbook"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").hotbar[title][2][1]
				get_node("./Alphaless").animation = "pages"
			elif get_node("../../Inventory").hotbar[title][2][0]=="Seeds":
				get_node("./AnimatedSprite2D").animation = "Seeds"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").hotbar[title][2][1]
				get_node("./Alphaless").animation = "empty"
			elif get_node("./AnimatedSprite2D").sprite_frames.has_animation(get_node("../../Inventory").hotbar[title][1]):
				get_node("./AnimatedSprite2D").animation = get_node("../../Inventory").hotbar[title][1]
				get_node("./Alphaless").animation = "empty"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").hotbar[title][2][1]
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
	if hotbar==false:
		if get_node("../../Inventory").twentyfive[title].size()>=2:
			if get_node("../../Inventory").twentyfive[title][2][0]=="Essence":
				get_node("./AnimatedSprite2D").animation = "Potion"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").twentyfive[title][2][1]
				get_node("./Alphaless").animation = "bottle"
			elif get_node("../../Inventory").twentyfive[title][2][0]=="Spellbook":
				get_node("./AnimatedSprite2D").animation = "Spellbook"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").twentyfive[title][2][1]
				get_node("./Alphaless").animation = "pages"
			elif get_node("../../Inventory").twentyfive[title][2][0]=="Scroll":
				get_node("./AnimatedSprite2D").animation = "Scroll"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").twentyfive[title][2][1]
				get_node("./Alphaless").animation = "paper"
			elif get_node("../../Inventory").twentyfive[title][2][0]=="Seeds":
				get_node("./AnimatedSprite2D").animation = "Seeds"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").twentyfive[title][2][1]
				get_node("./Alphaless").animation = "empty"
			elif get_node("./AnimatedSprite2D").sprite_frames.has_animation(get_node("../../Inventory").twentyfive[title][1]):
				get_node("./AnimatedSprite2D").animation = get_node("../../Inventory").twentyfive[title][1]
				get_node("./Alphaless").animation = "empty"
				get_node("./AnimatedSprite2D").modulate = get_node("../../Inventory").twentyfivealpha[title][1]
		if get_node("../../Inventory").twentyfivenumber[title] >= 2:
			killswitch=true
			num = amount.instantiate()
			num.type="Inventory"
			num.position.x=8
			num.position.y=6.5
			num.number=get_node("../../Inventory").twentyfivenumber[title]
			add_child(num)
		elif get_node("../../Inventory").twentyfivenumber[title]==0:
			get_node("./AnimatedSprite2D").animation = "empty"
			get_node("./Alphaless").animation = "empty"


func _on_mouse_entered() -> void:
	get_node("../../Inventory_Selector").path=""
	get_node("../../Inventory_Selector").position=self.position
	get_node("../../Inventory_Selector").hotbar=hotbar
	get_node("../../Inventory_Selector").title=title
	get_node("../../Inventory_Selector").type="Generic"
	get_node("../../Inventory_Selector").visible=true


func _on_mouse_exited() -> void:
	get_node("../../Inventory_Selector").path=""
	get_node("../../Inventory_Selector").visible=false
	get_node("../../Inventory_Selector").type=""
	get_node("../../Inventory_Selector").title=-1
