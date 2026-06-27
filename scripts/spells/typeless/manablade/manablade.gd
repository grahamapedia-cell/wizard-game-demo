extends Area2D
signal up
signal down
signal left
signal right
signal stop
@export var element = 0
@export var damagequal = 1
@export var damage = 5
@export var iframes = 0.75
@export var damagecolor = Color(0.3569,0.4314,0.8824)
var notnow = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("ManabladeDown").disabled = true
	get_node("ManabladeUp").disabled = true
	get_node("ManabladeLeft").disabled = true
	get_node("ManabladeRight").disabled = true
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position=get_node("../../..").global_position
	if get_node("../..").selected_spell=="Manablade" and get_node("../..").go==true:
		get_node("../..").go=false
		get_node("../..").currentlyCasting=true
		stop.emit()
		get_node("Swing").play(0.1)
		if get_node("../../..").direx==1&&notnow==false:
			get_node("../../..").movetypestore=get_node("../../..").movetype
			get_node("../../..").movetype="StrafeR"
			get_node("ManabladeRight").disabled = false
			show()
			right.emit()
		if get_node("../../..").direx==-1&&notnow==false:
			get_node("../../..").movetypestore=get_node("../../..").movetype
			get_node("../../..").movetype="StrafeL"
			show()
			get_node("ManabladeLeft").disabled = false
			left.emit()
		if get_node("../../..").direy==1&&notnow==false:
			get_node("../../..").movetypestore=get_node("../../..").movetype
			get_node("../../..").movetype="StrafeD"
			show()
			get_node("ManabladeDown").disabled = false
			down.emit()
		if get_node("../../..").direy==-1&&notnow==false:
			get_node("../../..").movetypestore=get_node("../../..").movetype
			get_node("../../..").movetype="StrafeU"
			show()
			get_node("ManabladeUp").disabled = false
			up.emit()
		if notnow==false:
			notnow=true
			await get_tree().create_timer(0.5).timeout
			get_node("../..").currentlyCasting=false
			get_node("ManabladeDown").disabled = true
			get_node("ManabladeUp").disabled = true
			get_node("ManabladeLeft").disabled = true
			get_node("ManabladeRight").disabled = true
			hide()
			stop.emit()
			notnow=false
			get_node("../../..").movetype=get_node("../../..").movetypestore


func _on_body_entered(body: Node2D):
	print(body.name)
	if body.has_signal("hit"):
		if body.iframes<=0:
			body.damaged=damage*body.elementmods[0]*body.damagequalmods[1]
			body.iframesread=iframes
			body.hitcolor=damagecolor
			body.hitby=[0,1]
			if body.position.x<self.position.x:
				body.numberflydirec=-1
			else:
				body.numberflydirec=1
