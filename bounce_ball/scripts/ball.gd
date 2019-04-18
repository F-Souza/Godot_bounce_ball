extends KinematicBody2D

var GRAV = 5
var velocity = Vector2()

var JUMP_FORCE = 360
var MOVE_FORCE = 270

onready var feet = get_node("feet")
onready var side = get_node("side_modify")

func _ready():
	
	set_process(true)
	
	pass

func _process(delta):
	
	velocity.y += GRAV
	velocity.x = MOVE_FORCE
	
	if feet.is_colliding():
		velocity.y -= JUMP_FORCE
	
	if side.is_colliding():
		MOVE_FORCE *= -1
		side.rotation_degrees += 180
	
	velocity = move_and_slide(velocity)
	
	pass
