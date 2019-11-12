extends KinematicBody2D

var current_dir = Vector2(1,0)
var next_dir = Vector2(0,0)

func _ready():
	hide()

func _process(delta):
	if global.inGame == true:
		show()
		# Find next direction
		if Input.is_action_just_pressed("ui_up"):
			next_dir = Vector2(0,-1)
		elif Input.is_action_just_pressed("ui_down"):
			next_dir = Vector2(0,1)
		elif Input.is_action_just_pressed("ui_left"):
			next_dir = Vector2(-1,0)
		elif Input.is_action_just_pressed("ui_right"):
			next_dir = Vector2(1,0)
		# Check if on next direction
		if !move_and_collide(next_dir*delta, true, true, true):
			current_dir = next_dir
			next_dir = Vector2(0,0)
		move_and_collide(current_dir/(delta*10))
	else:
		# Ready player data
		hide()
		position.x = 512
		position.y = 400
		current_dir = Vector2(1,0)
		next_dir = Vector2(0,0)