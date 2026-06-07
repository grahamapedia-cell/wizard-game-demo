extends Area2D
@export var ang=0
@export var element = 7
@export var damagequal = 0
@export var travelled = 0
@export var damage = 6
@export var iframes=0.5
@export var damagecolor=Color(0.5,0.3,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ang=get_node("../../..").ang
	rotate(ang)
	if get_node("../../..").projectile=="Rock":
		print(global_position)
		visible=false
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=cos(ang)*48*delta
	position.y+=sin(ang)*48*delta
	travelled+=48*delta
	if travelled>8:
		visible=true
	if travelled>=100 and self.visible==true:
		get_node("../../..").deathtime=true


func _on_body_entered(body: Node2D) -> void:
	print("yeah")
	get_node("/root/titlescreen/Game/Ysortedthings/player").health-=damage
	get_node("../../..").deathtime=true
