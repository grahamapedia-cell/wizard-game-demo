extends CharacterBody2D
signal cast
@export var direx = 0
@export var direy = 1
@export var SPEED = 50.0
@export var Speedmod = 1
@export var health=50
@export var maxhealth=50
@export var x = 0
@export var y = 0
@export var movetype = "Normal"
@export var movetypestore = "Normal"
var glopos = global_position
var Name = "player"
var screen_size
func _ready():
	screen_size = get_viewport_rect().size
	print(self.get_path())
	print(self.name)
	$AnimatedSprite2D.animation = "Frontwalk_overalls"
	self.global_position.y=50
	#hide()

func _process(delta):
	if Input.is_action_just_pressed("Hotbar_9"):
		print(self.global_position)
		self.global_position.x=0
		self.global_position.y=50
	glopos = global_position
	x=global_position.x
	y=global_position.y
	if movetype == "Slow":
		Speedmod=0.3
	else:
		Speedmod = 1
	if Input.is_action_just_pressed("cast_spell") and get_node("../../World/GUI/Inventory_things/Inventory").visible==false:
		cast.emit()
	var velocity = Vector2.ZERO #movement vector? I think that's like what direction the player's going in
	if Input.is_action_pressed("move_right") and get_node("../../World/GUI/Inventory_things/Inventory").visible==false and movetype!="Stop": #if you're going right, go right.
		if movetype=="StrafeR":
			velocity.x+=0.5
		elif movetype=="StrafeU" or movetype=="StrafeD":
			velocity.x+=0.75
		elif movetype=="StrafeL":
			velocity.x+=0.25
		else:
			velocity.x += 1
	if Input.is_action_pressed("move_left") and get_node("../../World/GUI/Inventory_things/Inventory").visible==false and movetype!="Stop": #if you're going left, go left.
		if movetype=="StrafeL":
			velocity.x-=0.5
		elif movetype=="StrafeU" or movetype=="StrafeD":
			velocity.x-=0.75
		elif movetype=="StrafeR":
			velocity.x-=0.25
		else:
			velocity.x -= 1
	if Input.is_action_pressed("move_up") and get_node("../../World/GUI/Inventory_things/Inventory").visible==false and movetype!="Stop":
		if movetype=="StrafeU":
			velocity.y-=0.5
		elif movetype=="StrafeL" or movetype=="StrafeR":
			velocity.y-=0.75
		elif movetype=="StrafeD":
			velocity.y-=0.25
		else:
			velocity.y -= 1
	if Input.is_action_pressed("move_down") and get_node("../../World/GUI/Inventory_things/Inventory").visible==false and movetype!="Stop":
		if movetype=="StrafeD":
			velocity.y+=0.5
		elif movetype=="StrafeL" or movetype=="StrafeR":
			velocity.y+=0.75
		elif movetype=="StrafeU":
			velocity.y+=0.25
		else:
			velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED * Speedmod
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.pause()
	position+=velocity*delta
	
	if velocity.y > 0 && abs(velocity.y)>abs(velocity.x) and movetype=="Normal":
		$AnimatedSprite2D.animation = "Frontwalk_overalls"
		direx = 0
		direy = 1
	elif velocity.y < 0 && abs(velocity.y)>abs(velocity.x) and movetype=="Normal":
		$AnimatedSprite2D.animation = "Backwalk_overalls"
		direx = 0
		direy = -1
	elif velocity.x > 0 && abs(velocity.x)>abs(velocity.y) and movetype=="Normal":
		$AnimatedSprite2D.animation = "Rightwalk_overalls"
		direx = 1
		direy = 0
	elif velocity.x < 0 &&abs(velocity.x)>abs(velocity.y) and movetype=="Normal":
		$AnimatedSprite2D.animation = "Leftwalk_overalls"
		direx = -1
		direy = 0
	move_and_slide()

func save():
	print("player")
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"direx": direx,
		"direy": direy,
		"SPEED": SPEED,
		"Speedmod": Speedmod,
		"health": health,
		"maxhealth": maxhealth,
		"x": x,
		"y": y,
		"movetype": movetype,
		"movetypestore": movetypestore,
		}
	return save_dict
