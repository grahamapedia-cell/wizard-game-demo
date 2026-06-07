extends RigidBody2D
signal hit
signal defeat
@export var hitby = ["Element","Quality"]
@export var elementtypes = ["Typeless","Fire","Lightning","Air","Ice","Water","Ooze","Earth","Metal"]
@export var elementmods = [1,1,1,1,1,1,1,1,1]
@export var damagequaltypes = ["Crush","Slash","Magic"]
@export var damagequalmods = [1,0.000001,0.00001]
@export var drop_One: PackedScene
@export var amount: PackedScene
@export var health = 16
@export var iframesread = 0
@export var iframes = 0
@export var hitcolor = Color(1,1,1)
@export var numberflydirec=0
var pasthealth = 20
var damaged = 0
var num
var dead = false
@export var maxHealth = 20
# Called when the node enters the scene tree for the first time.
@export var spawnRadius = 50


func _ready():
	global_position.x+=randf_range(-spawnRadius,spawnRadius)
	global_position.y+=randf_range(-spawnRadius,spawnRadius)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dead==false:
		get_node("Hitbox").set_deferred("disabled",!get_node("..").visible)
	if iframesread>=0 and iframes<=0 and damaged!=0:
		hit.emit()
		if damaged>0.001:
			health-=ceil(damaged)
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
		iframes=0
	if health>maxHealth:
		health=maxHealth
	if health<=0 and dead==false:
		health=0
		dead=true
		defeat.emit
		print("it happened")
		$Hitbox.set_deferred("disabled", true)
		var drop = drop_One.instantiate()
		drop.category="Metals"
		drop.itemtype="Metal Ore"
		drop.data=["Materials","Metal Ore",["Metals",Color(1,1,1),8]]
		drop.position.x=position.x
		drop.position.y=position.y
		add_sibling(drop)
		drop = drop_One.instantiate()
		drop.data=["Materials","Metal Ore",["Metals",Color(1,1,1),8]]
		drop.category="Metals"
		drop.itemtype="Metal Ore"
		drop.position.x=position.x
		drop.position.y=position.y
		add_sibling(drop)
		hide()


func _on_body_entered(body: CollisionShape2D):
	print(body.name)

func _on_defeat() -> void:
	pass


func _on_hit() -> void:
	print("aaa")
	
	 # Replace with function body.
