extends RigidBody2D
signal hit
signal defeat
var dead=false
@export var hitby = ["Element","Quality"]
@export var elementtypes = ["Typeless","Fire","Lightning","Air","Ice","Water","Ooze","Earth","Metal"]
@export var elementmods = [1,1,1,1,1,1,1,1,1]
@export var damagequaltypes = ["Crush","Slash","Magic"]
@export var damagequalmods = [1,1,1]
@export var drop_One: PackedScene
@export var amount: PackedScene
@export var speed = 0
@export var health = 20
@export var iframesread = 0
@export var iframes = 0
@export var hitcolor = Color(1,1,1)
@export var numberflydirec=0
var pasthealth = 20
var damaged =0
var num
@export var maxHealth = 20
@export var power = 0
# Called when the node enters the scene tree for the first time.
@export var spawnRadius = 50
func _ready():
	position.x+=randf_range(-spawnRadius,spawnRadius)
	position.y+=randf_range(-spawnRadius,spawnRadius)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dead==false:
		get_node("Hitbox").set_deferred("disabled",!get_node("../..").visible)
	if iframesread>0 and iframes<=0 and damaged!=0:
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
		$Hitbox.set_deferred("disabled", true)
		var drop = drop_One.instantiate()
		drop.data=["Materials","Stone",["Stone",[1,1,1],"Earth"]]
		drop.position.x=position.x
		drop.position.y=position.y
		add_sibling(drop)
		drop = drop_One.instantiate()
		drop.data=["Materials","Stone",["Stone",[1,1,1],"Earth"]]
		drop.position.x=position.x
		drop.position.y=position.y
		add_sibling(drop)
		hide()
func _on_body_entered(body: CollisionShape2D):
	print(body.name)

func save():
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"health": health,
		"speed": speed,
		"maxHealth": maxHealth,
		"dead": dead
		}
	return save_dict
