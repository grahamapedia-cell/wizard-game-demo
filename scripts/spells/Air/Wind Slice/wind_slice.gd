extends Node2D
@export var projectile: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position=get_node("../../..").global_position
	if get_node("../..").selected_spell=="Wind Slice" and get_node("../..").go==true:
		get_node("../../..").movetypestore=get_node("../../..").movetype
		get_node("../../..").movetype="Slow"
		show()
		get_node("../..").go=false
		get_node("../..").currentlyCasting=true
		await get_tree().create_timer(0.2).timeout
		get_node("../../..").movetype=get_node("../../..").movetypestore
		var shoot = projectile.instantiate()
		shoot.spell="Wind Slice"
		shoot.global_position.x=global_position.x
		shoot.global_position.y=global_position.y-8
		if get_node("../..").distx==0:
			if get_node("../..").disty>0:
				shoot.ang=PI/2
			elif get_node("../..").disty<0:
				shoot.ang=-PI/2
			else:
				shoot.ang=0
		elif get_node("../..").distx>0:
			shoot.ang=atan(get_node("../..").disty/get_node("../..").distx)
		else:
			shoot.ang=atan(get_node("../..").disty/get_node("../..").distx)+PI
		get_node("/root/titlescreen/Game/Ysortedthings").add_child(shoot)
		await get_tree().create_timer(0.5).timeout
		get_node("../..").currentlyCasting=false
