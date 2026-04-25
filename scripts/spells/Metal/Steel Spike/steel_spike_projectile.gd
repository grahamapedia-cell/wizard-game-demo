extends Area2D
@export var ang=0
@export var element = 8
@export var damagequal = 0
@export var travelled = 0
@export var damage = 6
@export var iframes=0.5
@export var damagecolor=Color(0.6,0.6,0.6)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ang = get_node("../..").ang
	rotate(ang)
	if get_node("../..").spell=="Steel Spike":
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
			body.damaged=damage*body.elementmods[8]*body.damagequalmods[0]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[8,0]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
