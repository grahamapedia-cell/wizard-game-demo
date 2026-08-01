extends RigidBody2D
var mousein = false
@export var window: PackedScene
var go
var inventory=[[],[]]
var inventorynumber=[0,0]
var itemlimit=[999,99]
var process=[]
var progress=0
var windowarrow=-1
var arrowon=false
var here = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_node("../..").data[1]!="Essence Extractor":
		hide()
		get_node("Hitbox").disabled=true
	else:
		here=true
	get_node("Damage").frame=randi_range(0,4) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if here==true:
		get_node("Hitbox").disabled=!get_node("../../..").visible
	if inventorynumber[0]<=0 and inventorynumber[1]<=0 and process==[]:
		arrowon=false
	else:
		arrowon=true
	if inventorynumber[0]>0 and progress==0:
		if inventorynumber[1]==0:
			windowarrow=0
			progress+=delta
			inventorynumber[0]-=1
			process=inventory[0]
		elif inventory[1].size()>=3:
			if inventory[0][2][2]==inventory[1][2][2]:
				windowarrow=0
				progress+=delta
				inventorynumber[0]-=1
				process=inventory[0]
	elif progress>0:
		if get_node("EEEEE").playing==false:
			get_node("EEEEE").play()
		progress+=delta
		windowarrow=floor(progress)
		if progress>=7:
			get_node("EEEEE").stop()
			inventory[1]=["Materials",process[2][3][0][1],["Essence",process[2][3][0][2][1],process[2][2]]]
			inventorynumber[1]+=process[2][3][1]
			process=[]
			progress=0
	if Input.is_action_just_pressed("open_inventory") and mousein==true and get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		print("go")
		get_node("/root/titlescreen/Game/Ysortedthings/Outside/ExtractorTorial").visible=false
		go = window.instantiate()
		go.path=String(self.get_path())
		go.machine="Essence Extractor"
		get_node("/root/titlescreen/Game/World/GUI/Inventory_things").add_child(go)


func _on_mouse_entered() -> void:
	mousein=true
	if get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		self.modulate=Color(1.2,1.2,1.2)
	print("mousein") # Replace with function body.


func _on_mouse_exited() -> void:
	self.modulate=Color(1,1,1)
	mousein=false # Replace with function body.

func save():
	var save_dict={
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"inventory": inventory,
		"inventorynumber": inventorynumber,
		"process": process,
		"progress": progress,
		"arrowon": arrowon
	}
	return save_dict
