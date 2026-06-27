extends Area2D
@export var ang=0
@export var element = 3
@export var damagequal = 2
@export var travelled = 0
@export var damage = 4
@export var iframes=0.5
@export var damagecolor=Color(0,1,0.5)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ang = get_node("../..").ang
	rotate(ang)
	if get_node("../..").spell=="Wind Slice":
		get_node("../..")
		show()
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		global_position.x+=cos(ang)*90*delta
		global_position.y+=sin(ang)*90*delta
		travelled+=90*delta
		if travelled>=100 and self.visible==true:
			get_node("../..").deathtime=true


func _on_body_entered(body: Node2D) -> void:
	if body.has_signal("hit"):
		if body.iframes<=0 and self.visible==true:
			print(body.name)
			get_node(get_node("../..").path+"/Whoosh").play(0.25)
			if body.damagequalmods[2]<1:
				body.damaged=int(damage*body.elementmods[3]*(1+body.damagequalmods[2])/2)
			else:
				body.damaged=damage*body.elementmods[3]*body.damagequalmods[2]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[3,2]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
