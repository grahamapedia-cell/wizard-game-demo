extends Area2D
@export var amount: PackedScene
var num
var killswitch=false
var item=[]
var itemnumber=0
var path
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("..").is_queued_for_deletion()==false:
		self.input_pickable=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path=get_node("../../..").path
	item=get_node(path).inventory[1]
	itemnumber=get_node(path).inventorynumber[1]
	if item==[]:
		get_node("./AnimatedSprite2D").animation = "empty"
		get_node("./Alphaless").animation = "empty"
		get_node("./AnimatedSprite2D").modulate = Color(1,1,1)
	else:
		if item[2][0]=="Essence":
			get_node("./AnimatedSprite2D").animation = "Potion"
			get_node("./Alphaless").animation = "bottle"
			get_node("./AnimatedSprite2D").modulate = item[2][1]
		elif get_node("./AnimatedSprite2D").sprite_frames.has_animation(item[1]):
			get_node("./AnimatedSprite2D").animation = item[1]
			get_node("./Alphaless").animation = "empty"
			get_node("./AnimatedSprite2D").modulate = item[2][1]
		else:
			get_node("./AnimatedSprite2D").animation = "empty"
			get_node("./Alphaless").animation = "empty"
			get_node("./AnimatedSprite2D").modulate = Color(1,1,1)
		if itemnumber >= 2:
			killswitch=true
			num = amount.instantiate()
			num.type="Inventory"
			num.position.x=8
			num.position.y=6.5
			num.number=itemnumber
			add_child(num)


func _on_mouse_entered() -> void:
	get_node("../../../../Inventory_Selector").position=self.position
	get_node("../../../../Inventory_Selector").z_index=11
	get_node("../../../../Inventory_Selector").visible=true
	get_node("../../../../Inventory_Selector").type="Output"
	get_node("../../../../Inventory_Selector").path=path
	get_node("../../../../Inventory_Selector").hotbar=false
	get_node("../../../../Inventory_Selector").title=1


func _on_mouse_exited() -> void:
	get_node("../../../../Inventory_Selector").visible=false
	get_node("../../../../Inventory_Selector").type=""
	get_node("../../../../Inventory_Selector").path=""
	get_node("../../../../Inventory_Selector").z_index=8
	get_node("../../../../Inventory_Selector").title=-1
