extends Area2D
@export var spawnRadius = 10
@export var Inventory_item: PackedScene
@export var just_thrown=false
var attract = false
var player_dist_x = 0
var player_dist_y = 0
var player_dist = 0
var velocity_x = 0
var velocity_y = 0
@export var quantity = 1
var physical = true
var donehere = false
var item_name="test"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity_x=get_node("..").velx
	velocity_y=get_node("..").vely
	just_thrown = get_node("..").just_thrown
	quantity = get_node("..").quantity
	print(get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x)
	if get_node("./AnimatedSprite2D").sprite_frames.has_animation(get_node("..").data[1]):
		item_name=get_node("..").itemtype
		get_node("./AnimatedSprite2D").animation=get_node("..").data[1]
	elif get_node("..").data[2][0]=="Seeds":
		get_node("./AnimatedSprite2D").animation="Seeds"
		self.modulate=ColorStruct(get_node("..").data[2][1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("CollisionShape2D").set_deferred("disabled",!get_node("..").visible)
	physical=get_node("..").visible
	if just_thrown == true:
		await get_tree().create_timer(3).timeout
		just_thrown=false
	if physical == true and get_node_or_null("/root/titlescreen/Game/Ysortedthings/player")!=null:
		player_dist_x = get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<=30 and player_dist !=0 and just_thrown==false:
			attract=true
			velocity_x = player_dist_x/player_dist/3
			velocity_y = player_dist_y/player_dist/3
		if player_dist>40:
			if attract==true:
				velocity_x = 0
				velocity_y = 0
				attract = false
			just_thrown=false
		if attract==false:
			velocity_x*=0.9
			velocity_y*=0.9
			if velocity_x <=0.05:
				velocity_x=0
			if velocity_x <=0.05:
				velocity_x=0
		if player_dist>1000:
			queue_free()
		global_position.x+=velocity_x*delta*90
		global_position.y+=velocity_y*delta*90
		player_dist_x = get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/titlescreen/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<5 and just_thrown==false:
			for i in get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").hotbar.size():
				if get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").hotbar[i]==[] and donehere==false:
					get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").hotbar[i]=get_node("..").data
					get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]+=quantity
					donehere=true
					queue_free()
			for i in get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").twentyfive.size():
				if get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]==[] and donehere==false:
					get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]=get_node("..").data
					get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]+=quantity
					donehere=true
					queue_free()
			if donehere==true:
				get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory/Pickup").play()
	else:
		queue_free()


func ColorStruct(array):
	if array.size()<4:
		return Color(array[0],array[1],array[2])
	else:
		return Color(array[0],array[1],array[2],array[3])
