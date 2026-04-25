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
var item_name = "test"
var sprite=""
@export var quantity = 1
var physical = true
var donehere = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity_x=get_node("..").velx
	velocity_y=get_node("..").vely
	just_thrown = get_node("..").just_thrown
	quantity = get_node("..").quantity
	print(get_node("/root/Game/Ysortedthings/player").global_position.x)
	if get_node("./AnimatedSprite2D").sprite_frames.has_animation(get_node("..").itemtype):
		item_name=get_node("..").itemtype
		get_node("./AnimatedSprite2D").animation=item_name
	elif get_node("..").data[2][0]=="Essence":
		item_name=get_node("..").data[2][1]+" Essence"
		get_node("./AnimatedSprite2D").animation="Potion"
		get_node("./Alphaless").animation="bottle"
	elif get_node("..").data[2][0]=="Seeds":
		item_name=get_node("..").data[2][4]+" Seeds"
		get_node("./AnimatedSprite2D").animation="Seeds"
		self.modulate=get_node("..").data[2][3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("CollisionShape2D").disabled=!self.visible
	physical=self.visible
	if just_thrown == true:
		await get_tree().create_timer(3).timeout
		just_thrown=false
	if physical == true:
		player_dist_x = get_node("/root/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<=30 and player_dist !=0 and just_thrown==false:
			velocity_x = player_dist_x/player_dist/3
			velocity_y = player_dist_y/player_dist/3
			attract = true
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
		global_position.x+=velocity_x*delta*60
		global_position.y+=velocity_y*delta*60
		player_dist_x = get_node("/root/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<5 and just_thrown==false:
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar[i]==item_name and get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]<999 and donehere==false:
					if 999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]<quantity:
						get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]+=999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]
						quantity-=999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]
					else:
						get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]+=quantity
						donehere=true
						queue_free()
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]==item_name and get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]<=999-quantity and donehere==false:
					if 999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]<quantity:
						get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]+=999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]
						quantity-=999-get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]
					else:
						get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]+=quantity
						donehere=true
						queue_free()
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar[i]=="" and donehere==false:
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar[i]=item_name
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]+=quantity
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbardata[i]=get_node("..").data
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarlimit[i]=999
					donehere=true
					queue_free()
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]=="" and donehere==false:
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]=item_name
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]+=quantity
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivedata[i]=get_node("..").data
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivelimit[i]=999
					donehere=true
					queue_free()
			if donehere==true:
				get_node("/root/Game/World/GUI/Inventory_things/Inventory/Pickup").play()
	else:
		queue_free()
