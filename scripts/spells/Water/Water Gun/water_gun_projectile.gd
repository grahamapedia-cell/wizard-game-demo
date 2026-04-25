extends Area2D
@export var ang=0
@export var element = 5
@export var damagequal = 2
@export var travelled = 0
@export var damage = 4
@export var iframes=0.5
@export var damagecolor=Color(0.3,0.3,1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ang = get_node("../..").ang
	rotate(ang)
	if get_node("../..").spell=="Water Gun":
		get_node("../..")
		show()
	else:
		hide()
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		global_position.x+=cos(ang)*delta*60
		global_position.y+=sin(ang)*delta*60
		travelled+=delta*60
		if travelled>=150 and self.visible==true:
			get_node("../..").deathtime=true


func _on_body_entered(body: Node2D) -> void:
	if body.has_signal("hit"):
		if body.iframes<=0 and self.visible==true:
			print(body.name)
			body.damaged=damage*body.elementmods[5]*body.damagequalmods[2]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[5,2]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
			get_node("../..").deathtime=true
