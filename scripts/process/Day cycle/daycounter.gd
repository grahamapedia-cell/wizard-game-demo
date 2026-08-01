extends Sprite2D
@export var day: PackedScene
var num
var hourhand=24*12
var frames=0
var checkframes=0
var hoursdone=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.get_path())
	get_node("Hourhand").scale.y=-1 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().is_paused()==false:
		frames+=delta
	if checkframes!=floor(frames):
		if floor(frames)>=48:
			frames=0
			hoursdone+=1
		hourhand+=1 #multiply by 12
		if hoursdone>=20:
			hoursdone=0
			frames=0
			hourhand=24*12
			get_node("/root/titlescreen/Game/World/Time").day+=1
		if hourhand==576:
			hourhand=0
		if floor(frames)<=6:
			get_node("Minutehand").scale.y=1
			get_node("Minutehand").rotation=0
			get_node("Minutehand").frame=floor(frames)
		elif floor(frames)<=12:
			get_node("Minutehand").scale.y=-1
			get_node("Minutehand").rotation=-PI/2
			get_node("Minutehand").frame=12-floor(frames)
		elif floor(frames)<=18:
			get_node("Minutehand").scale.y=1
			get_node("Minutehand").rotation=PI/2
			get_node("Minutehand").frame=floor(frames)-12
		elif floor(frames)<=24:
			get_node("Minutehand").scale.y=-1
			get_node("Minutehand").rotation=0
			get_node("Minutehand").frame=24-floor(frames)
		elif floor(frames)<=30:
			get_node("Minutehand").scale.y=1
			get_node("Minutehand").rotation=PI
			get_node("Minutehand").frame=floor(frames)-24
		elif floor(frames)<=36:
			get_node("Minutehand").scale.y=-1
			get_node("Minutehand").rotation=PI/2
			get_node("Minutehand").frame=36-floor(frames)
		elif floor(frames)<=42:
			get_node("Minutehand").scale.y=1
			get_node("Minutehand").rotation=-PI/2
			get_node("Minutehand").frame=floor(frames)-36
		elif floor(frames)<=47:
			get_node("Minutehand").scale.y=-1
			get_node("Minutehand").rotation=PI
			get_node("Minutehand").frame=48-floor(frames)
		if hourhand<=6*12+11:
			get_node("Hourhand").scale.y=1
			get_node("Hourhand").rotation=0
			get_node("Hourhand").frame=floor(hourhand/12)
		elif hourhand<=12*12+11:
			get_node("Hourhand").scale.y=-1
			get_node("Hourhand").rotation=-PI/2
			get_node("Hourhand").frame=12-floor(hourhand/12)
		elif hourhand<=18*12+11:
			get_node("Hourhand").scale.y=1
			get_node("Hourhand").rotation=PI/2
			get_node("Hourhand").frame=floor(hourhand/12)-12
		elif hourhand<=24*12+11:
			get_node("Hourhand").scale.y=-1
			get_node("Hourhand").rotation=0
			get_node("Hourhand").frame=24-floor(hourhand/12)
		elif hourhand<=30*12+11:
			get_node("Hourhand").scale.y=1
			get_node("Hourhand").rotation=PI
			get_node("Hourhand").frame=floor(hourhand/12)-24
		elif hourhand<=36*12+11:
			get_node("Hourhand").scale.y=-1
			get_node("Hourhand").rotation=PI/2
			get_node("Hourhand").frame=36-floor(hourhand/12)
		elif hourhand<=42*12+11:
			get_node("Hourhand").scale.y=1
			get_node("Hourhand").rotation=-PI/2
			get_node("Hourhand").frame=floor(hourhand/12)-36
		elif hourhand<=47*12+11:
			get_node("Hourhand").scale.y=-1
			get_node("Hourhand").rotation=PI
			get_node("Hourhand").frame=48-floor(hourhand/12)
		print(frames)
	checkframes=floor(frames)
	num = day.instantiate()
	num.type="Inventory"
	num.scale.x=2
	num.scale.y=2
	num.position.x=5
	num.position.y=4
	if get_node_or_null("../../Time")!=null:
		num.number=get_node("../../Time").day
	add_child(num)
