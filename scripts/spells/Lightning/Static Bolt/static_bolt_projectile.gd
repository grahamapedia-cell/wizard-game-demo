extends Area2D
@export var ang=0
@export var element = 2
@export var damagequal = 2
@export var travelled = 0
@export var damage = 2
@export var iframes=0.2
@export var damagecolor=Color(1,0.9,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ang = get_node("../../..").ang
	rotate(ang)
	if get_node("../../..").spell=="Static Bolt":
		get_node("../../..")
		self.visible=true
		get_node("../Back Hitbox").visible=true
	else:
		self.visible=false
		get_node("../Back Hitbox").visible=false
		queue_free()
		get_node("../Back Hitbox").queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		global_position.x+=cos(ang)*90*delta
		global_position.y+=sin(ang)*90*delta
		get_node("../Back Hitbox").global_position.x+=cos(ang)*90*delta
		get_node("../Back Hitbox").global_position.y+=sin(ang)*90*delta
		travelled+=90*delta
		if travelled>=100 and self.visible==true:
			get_node("../../..").deathtime=true


func _on_body_entered(body: Node2D) -> void:
	if body.has_signal("hit"):
		if body.iframes<=0 and self.visible==true:
			print(self.name)
			body.damaged+=damage*body.elementmods[2]*body.damagequalmods[2]
			body.iframesread=0.00001
			body.hitcolor=damagecolor
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1


func _on_back_hitbox_body_entered(body: Node2D) -> void:
	if body.has_signal("hit"):
		if self.visible==true:
			print(body.name)
			body.damaged+=damage*body.elementmods[2]*body.damagequalmods[2]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[2,2]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
