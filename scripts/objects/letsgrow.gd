extends Area2D
var days = 0
var timecheck=0
var grown=false
var mousein=false
@export var crop: PackedScene
var harvest
var here=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.name)
	timecheck=get_node("/root/titlescreen/Game/World/Time").day
	self.input_pickable==false
	if get_node("../../..").data[1]==self.name:
		print(self.name)
		get_node("AnimatedSprite2D").frame=0
		get_node("Finalcrop").visible=false
	else:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if here==true:
		get_node("Hitbox").disabled=!self.visible
	if Input.is_action_just_pressed("use_item") and self.visible==true and mousein==true and grown==true and get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		harvest = crop.instantiate()
		harvest.category="Crops"
		harvest.data=get_node("../../..").data[2][3][0]
		harvest.itemtype=self.name
		harvest.global_position.x=global_position.x
		harvest.global_position.y=global_position.y
		get_node("/root/titlescreen/Game/Ysortedthings").add_child(harvest)
		mousein=false
		queue_free()
	if timecheck!=get_node("/root/titlescreen/Game/World/Time").day:
		if grown==false:
			get_node("AnimatedSprite2D").frame=get_node("AnimatedSprite2D").frame+1
		if get_node("AnimatedSprite2D").sprite_frames.get_frame_count("Demo_Crop")-1==get_node("AnimatedSprite2D").frame:
			get_node("Finalcrop").visible=true
			self.input_pickable=true
			grown=true
	timecheck=get_node("/root/titlescreen/Game/World/Time").day




func _on_mouse_entered() -> void:
	if self.input_pickable==true:
		self.modulate=Color(1.2,1.2,1.2)
		mousein=true # Replace with function body.


func _on_mouse_exited() -> void:
	self.modulate=Color(1,1,1)
	mousein=false # Replace with function body.
