extends MarginContainer
@export var text=""
var done=false
var type=""
var title=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("MarginContainer/Label").text=text
	if type=="Inventory":
		self.scale.x=0.5
		self.scale.y=0.5
		title=get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory_Selector").title


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("MarginContainer/Label").text=text
	if done==true:
		queue_free()
	if type=="Inventory":
		if get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory_Selector").title!=title:
			done=true
