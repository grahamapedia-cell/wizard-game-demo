extends Area2D
var mousein=false
var go
var inventory = [[],[],[],[],[],[],[],[]]
var inventorynumber=[0,0,0,0,0,0,0,0]
var itemlimit=[99,99,99,99,99,99,99,99]
@export var window: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.input_pickable=get_node("..").visible
	if self.input_pickable==false:
		mousein=false
	if Input.is_action_just_pressed("open_inventory") and mousein==true and get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		get_node("../OrbTorial").visible=false
		go = window.instantiate()
		go.path=String(self.get_path())
		go.machine="ORB"
		get_node("/root/titlescreen/Game/World/GUI/Inventory_things").add_child(go)
	if inventory[0].size()>=2:
		if inventory[0][1]=="Fire Essence":
			inventory[1]=["Spellbooks","Flame Shot Scroll",["Scroll",Color(1,0.4,0),1,["Flame Shot"]]]
			inventorynumber[1]=inventorynumber[0]
			inventory[0]=[]
			inventorynumber[0]=0
	if inventory[2].size()>=2:
		if inventory[2][1]=="Air Essence":
			inventory[3]=["Spellbooks","Wind Slice Scroll",["Scroll",Color(0.5,1,0.8),3,["Wind Slice"]]]
			inventorynumber[3]=inventorynumber[2]
			inventory[2]=[]
			inventorynumber[2]=0
	if inventory[4].size()>=2:
		if inventory[4][1]=="Water Essence":
			inventory[5]=["Spellbooks","Water Gun Scroll",["Scroll",Color(0.1,0.4,0.6),5,["Water Gun"]]]
			inventorynumber[5]=inventorynumber[4]
			inventory[4]=[]
			inventorynumber[4]=0
	if inventory[6].size()>=2:
		if inventory[6][1]=="Earth Essence":
			inventory[7]=["Spellbooks","Rock Throw Scroll",["Scroll",Color(0.5,0.3,0),7,["Rock Throw"]]]
			inventorynumber[7]=inventorynumber[6]
			inventory[6]=[]
			inventorynumber[6]=0


func _on_mouse_entered() -> void:
	mousein=true
	if get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		self.modulate=Color(1.2,1.2,1.2)
	print("orb")


func _on_mouse_exited() -> void:
	mousein=false
	self.modulate=Color(1,1,1)
	print("norb") # Replace with function body.
