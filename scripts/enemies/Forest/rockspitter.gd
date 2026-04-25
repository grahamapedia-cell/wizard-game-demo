extends RigidBody2D
signal hit
signal defeat
var dead=false
@export var hatted = true
@export var state = "Idle"
@export var hitby = ["Element","Quality"]
@export var elementtypes = ["Typeless","Fire","Lightning","Air","Ice","Water","Ooze","Earth","Metal"]
@export var elementmods = [1,1,1,1,1,1,1,1,1]
@export var damagequaltypes = ["Crush","Slash","Magic"]
@export var damagequalmods = [1,0.5,0.5]
@export var drop_One: PackedScene
@export var amount: PackedScene
@export var shoot: PackedScene
@export var speed = 0
@export var health = 20
@export var iframesread = 0
@export var iframes = 0
@export var hitcolor = Color(1,1,1)
@export var numberflydirec=0
var pasthealth = 20
var damaged =0
var num
var rock
var angle=0
@export var maxHealth = 20
@export var power = 0
# Called when the node enters the scene tree for the first time.
@export var spawnRadius = 50
func _ready():
	global_position.x+=randf_range(-spawnRadius,spawnRadius)
	global_position.y+=randf_range(-spawnRadius,spawnRadius)
	get_node("AnimatedSprite2D").animation="Peek"
	get_node("Rockhead").animation="Peek"
	get_node("AnimatedSprite2D").play()
	get_node("Rockhead").play()

#Note: Get all the enemies and breakable objects to actually go away when dead

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dead==false:
		var facing = "front"
		get_node("Hitbox").set_deferred("disabled",!get_node("../..").visible)
		if get_node("../..").visible==true:
			var distx=get_node("/root/Game/Ysortedthings/player").global_position.x-self.global_position.x
			var disty=get_node("/root/Game/Ysortedthings/player").global_position.y-self.global_position.y
			var dist=sqrt(pow(distx,2)+pow(disty,2))
			if distx==0:
				angle=(PI/2)*disty/abs(disty)
			elif distx>0:
				angle=atan(disty/distx)
			else:
				angle=PI+atan(disty/distx)
			if -PI/8<=angle and angle<PI/8:
				facing="right"
			elif PI/8<=angle and angle<3*PI/8:
				facing="fr"
			elif 3*PI/8<=angle and angle<5*PI/8:
				facing="front"
			elif 5*PI/8<=angle and angle<7*PI/8:
				facing="fl"
			elif 7*PI/8<=angle and angle<9*PI/8:
				facing="left"
			elif 9*PI/8<=angle and angle<11*PI/8:
				facing="bl"
			elif 11*PI/8<=angle and angle<=3*PI/2:
				facing="back"
			elif -PI/2<=angle and angle<-3*PI/8:
				facing="back"
			else:
				facing="br"
			if state=="Hit":
				pass
			elif dist<=50 and hatted==true:
				state="Hide"
			elif dist<=100:
				if state!="Notice" and state!="Attack":
					state="Notice"
			else:
				state="Idle"
			if state=="Hide":
				get_node("AnimatedSprite2D").animation="Down"
				get_node("Rockhead").animation="Down"
			elif state=="Idle":
				if get_node("AnimatedSprite2D").animation!="Peek":
					get_node("AnimatedSprite2D").animation="Peek"
					get_node("Rockhead").animation="Peek"
					get_node("AnimatedSprite2D").play()
					get_node("Rockhead").play()
			elif state=="Notice":
				if get_node("Rockhead").animation!="Pop_out":
					get_node("AnimatedSprite2D").animation="Pop_out_"+facing
					get_node("Rockhead").animation="Pop_out"
					get_node("AnimatedSprite2D").play()
					get_node("Rockhead").play()
			elif state=="Attack":
				if get_node("AnimatedSprite2D").animation!="Idle_"+facing:
					get_node("AnimatedSprite2D").animation="Idle_"+facing
					get_node("Rockhead").animation="Useless"
					get_node("Rockhead").animation="Idle"
					get_node("AnimatedSprite2D").play()
					get_node("Rockhead").play()
		if iframesread>0 and iframes<=0 and damaged!=0:
			if hitby[1]==0:
				hatted=false
				get_node("Rockhead").visible=false
				damagequalmods = [1,1,1]
			if damaged>0.001:
				health-=ceil(damaged)
				state="Hit"
				get_node("AnimatedSprite2D").animation="Hit_"+facing
				get_node("Rockhead").animation="Hit"
				get_node("AnimatedSprite2D").play()
				get_node("Rockhead").play()
			iframes=iframesread
			iframesread=0
			self.modulate=Color(1,1,1,0.5)
			num = amount.instantiate()
			num.type="Damage"
			num.color = hitcolor
			num.position.x=position.x
			num.position.y=position.y
			num.bounce=numberflydirec
			if damaged<=0.001:
				num.number=0
			else:
				num.number=ceil(damaged)
			add_sibling(num)
			damaged=0
			if iframes>0.001:
				await get_tree().create_timer(iframes).timeout
			self.modulate=Color(1,1,1)
			hitcolor = Color(1,1,1)
			state="Attack"
			get_node("AnimatedSprite2D").animation="Idle_"+facing
			get_node("Rockhead").animation="Idle"
			get_node("AnimatedSprite2D").play()
			get_node("Rockhead").play()
			iframes=0
		if health>maxHealth:
			health=maxHealth
		if health<=0 and dead==false:
			health=0
			dead=true
			defeat.emit
			$Hitbox.set_deferred("disabled", true)
			var drop = drop_One.instantiate()
			drop.category="Stone"
			drop.itemtype="Stone"
			drop.position.x=position.x
			drop.position.y=position.y
			add_sibling(drop)
			drop = drop_One.instantiate()
			drop.category="Stone"
			drop.itemtype="Stone"
			drop.position.x=position.x
			drop.position.y=position.y
			add_sibling(drop)
			hide()
	else:
		queue_free()


func _on_body_entered(body: CollisionShape2D):
	print(body.name)


func _on_animated_sprite_2d_animation_finished() -> void:
	if state=="Peeking":
		print(state)
		state="Idle"
	elif state=="Notice":
		print(state)
		state="Attack"
	elif state=="Hit":
		state=="Idle"
	elif state=="Attack":
		print(self.global_position)
		rock = shoot.instantiate()
		rock.ang=angle
		rock.projectile="Rock"
		add_child(rock)
		get_node("AnimatedSprite2D").play()
