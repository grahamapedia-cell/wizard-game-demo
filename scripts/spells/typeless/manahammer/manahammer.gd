extends Area2D
signal up
signal down
signal left
signal right
signal stop
@export var element = 0
@export var damagequal = 0
@export var damage = 8
@export var iframes = 0.8
@export var damagecolor = Color(0.3569,0.4314,0.8824)
var notnow = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("ManahammerDown").disabled = true
	get_node("ManahammerUp").disabled = true
	get_node("ManahammerLeft").disabled = true
	get_node("ManahammerRight").disabled = true
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position=get_node("../../..").global_position
	if get_node("../..").selected_spell=="Manahammer" and get_node("../..").go==true:
		get_node("../..").go=false
		get_node("../..").currentlyCasting=true
		stop.emit()
		get_node("../../..").movetypestore=get_node("../../..").movetype
		get_node("../../..").movetype="Stop"
		await get_tree().create_timer(0.2).timeout
		if get_node("../../..").direx==1&&notnow==false:
			get_node("ManahammerRight").disabled = false
			show()
			right.emit()
		if get_node("../../..").direx==-1&&notnow==false:
			show()
			get_node("ManahammerLeft").disabled = false
			left.emit()
		if get_node("../../..").direy==1&&notnow==false:
			show()
			get_node("ManahammerDown").disabled = false
			down.emit()
		if get_node("../../..").direy==-1&&notnow==false:
			show()
			get_node("ManahammerUp").disabled = false
			up.emit()
		if notnow==false:
			notnow=true
			await get_tree().create_timer(0.7).timeout
			get_node("../..").currentlyCasting=false
			get_node("ManahammerDown").disabled = true
			get_node("ManahammerUp").disabled = true
			get_node("ManahammerLeft").disabled = true
			get_node("ManahammerRight").disabled = true
			hide()
			stop.emit()
			notnow=false
			get_node("../../..").movetype=get_node("../../..").movetypestore


func _on_body_entered(body: Node2D):
	print(body.name)
	if body.has_signal("hit"):
		if body.iframes<=0:
			body.damaged=damage*body.elementmods[0]*body.damagequalmods[0]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[0,0]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
