extends RigidBody2D
var mousein = false
@export var window: PackedScene
var go
var inventory=["",""]
var inventorynumber=[0,0]
var inventoryalpha=[Color(1,1,1),Color(1,1,1)]
var inventorydata=[[],[]]
var itemlimit=[999,99]
var processdata=[]
var progress=0
var windowarrow=-1
var arrowon=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Damage").frame=randi_range(0,4) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Hitbox").disabled=!get_node("../../..").visible
	if inventorynumber[0]<=0 and inventorynumber[1]<=0 and processdata==[]:
		arrowon=false
	else:
		arrowon=true
	if inventorynumber[0]>0 and progress==0:
		if inventorynumber[1]==0:
			windowarrow=0
			progress+=delta
			inventorynumber[0]-=1
			processdata=inventorydata[0]
		elif inventorydata[1].size()>=3:
			if inventorydata[0][2][1]==inventorydata[1][2][1]:
				windowarrow=0
				progress+=delta
				inventorynumber[0]-=1
				processdata=inventorydata[0]
	elif progress>0:
		if get_node("EEEEE").playing==false:
			get_node("EEEEE").play()
		progress+=delta
		windowarrow=floor(progress)
		if progress>=7:
			get_node("EEEEE").stop()
			inventory[1]=processdata[2][1]+" Essence"
			inventorynumber[1]+=processdata[2][2]
			inventoryalpha[1]=processdata[2][3]
			inventorydata[1]=["Materials","Essence",["Essence",processdata[2][1],processdata[2][3]]]
			processdata=[]
			progress=0
	if Input.is_action_just_pressed("open_inventory") and mousein==true and get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		print("go")
		go = window.instantiate()
		go.path=String(self.get_path())
		go.machine="Essence Extractor"
		get_node("/root/titlescreen/Game/World/GUI/Inventory_things").add_child(go)


func _on_mouse_entered() -> void:
	mousein=true
	print("mousein") # Replace with function body.


func _on_mouse_exited() -> void:
	mousein=false # Replace with function body.
