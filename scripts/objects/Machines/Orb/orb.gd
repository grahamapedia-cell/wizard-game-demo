extends Area2D
var mousein=false
var go
var inventory = ["","","","","","","",""]
var inventorynumber=[0,0,0,0,0,0,0,0]
var inventoryalpha=[Color(1,1,1),Color(1,1,1),Color(1,1,1),Color(1,1,1),Color(1,1,1),Color(1,1,1),Color(1,1,1),Color(1,1,1)]
var inventorydata=[[],[],[],[],[],[],[],[]]
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
		go = window.instantiate()
		go.path=String(self.get_path())
		go.machine="ORB"
		get_node("/root/titlescreen/Game/World/GUI/Inventory_things").add_child(go)
	if inventory[0]=="Fire Essence":
		inventory[1]="Flame Shot Scroll"
		inventorynumber[1]=inventorynumber[0]
		inventoryalpha[1]=inventoryalpha[0]
		inventorydata[1]=["Spellbook","Flame Shot Scroll",["Scrolls",Color(255,102,0),1,["Flame Shot"]]]
		inventory[0]=""
		inventorynumber[0]=0
		inventoryalpha[0]=Color(1,1,1)
		inventorydata[0]=[]
	if inventory[2]=="Air Essence":
		inventory[3]="Wind Slice Scroll"
		inventorynumber[3]=inventorynumber[2]
		inventoryalpha[3]=inventoryalpha[2]
		inventorydata[3]=["Spellbook","Wind Slice Scroll",["Scrolls",Color(130,255,204),3,["Wind Slice"]]]
		inventory[2]=""
		inventorynumber[2]=0
		inventoryalpha[2]=Color(1,1,1)
		inventorydata[2]=[]
	if inventory[4]=="Water Essence":
		inventory[5]="Water Gun Scroll"
		inventorynumber[5]=inventorynumber[4]
		inventoryalpha[5]=inventoryalpha[4]
		inventorydata[5]=["Spellbook","Water Gun Scroll",["Scrolls",Color(26,102,153),5,["Water Gun"]]]
		inventory[4]=""
		inventorynumber[4]=0
		inventoryalpha[4]=Color(1,1,1)
		inventorydata[4]=[]
	if inventory[6]=="Earth Essence":
		inventory[7]="Rock Throw Scroll"
		inventorynumber[7]=inventorynumber[6]
		inventoryalpha[7]=inventoryalpha[6]
		inventorydata[7]=["Spellbook","Rock Throw Scroll",["Scrolls",Color(130,77,0),7,["Rock Throw"]]]
		inventory[6]=""
		inventorynumber[6]=0
		inventoryalpha[6]=Color(1,1,1)
		inventorydata[6]=[]


func _on_mouse_entered() -> void:
	mousein=true
	print("orb")


func _on_mouse_exited() -> void:
	mousein=false
	print("norb") # Replace with function body.
