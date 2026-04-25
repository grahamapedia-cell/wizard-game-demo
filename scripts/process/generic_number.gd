extends AnimatedSprite2D
@export var second: PackedScene
@export var number = 0
@export var color = Color(1,1,1,1)
@export var type = ""
@export var offset_x = 0
@export var offset_y = 0
@export var bounce = 0
var secondoff = 0
var bonus = 0
var flumber = 0
var justnumber=0
@export var opacity = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate = color
	position.x+=offset_x
	position.y+=offset_y
	self.animation="Numbers"
	number=int(ceil(number))
	self.frame=number%10
	self.pause
	flumber = number
	secondoff = 0
	if len(str(number))>1:
		for i in range(1,len(str(number))):
			flumber = floor(flumber/10)
			secondoff-=4
			var adds = second.instantiate()
			adds.number=flumber%10
			adds.position.x=secondoff
			add_child(adds)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if type == "Inventory":
		if justnumber==1:
			queue_free()
		justnumber=1
	if type == "Inventory":
		if justnumber==1:
			queue_free()
		justnumber=1
	if type == "Damage":
		if opacity<=1:
			color = Color(color.r,color.g,color.b,opacity)
		else:
			color = Color(color.r,color.g,color.b,1)
		self.modulate=color
		position.x+=bounce/2
		position.y-=0.5
		opacity -= 0.02
		if opacity<=0:
			queue_free()
