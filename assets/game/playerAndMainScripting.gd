extends KinematicBody2D

var current_dir = Vector2(0,0)
var next_dir = Vector2(0,0)

func _ready():
	pass # Replace with function body.

func _process(delta):
	if global.inGame == true:
		if Input.is_action_just_pressed("ui_up"):
			next_dir = Vector2(0,1)
		elif Input.is_action_just_pressed("ui_down"):
			next_dir = Vector2(0,-1)
		elif Input.is_action_just_pressed("ui_left"):
			next_dir = Vector2(-1,0)
		elif Input.is_action_just_pressed("ui_right"):
			next_dir = Vector2(1,0)
		position += next_dir
		position -= next_dir
	else:
		position.x = 512
		position.y = 400
		current_dir = Vector2(1,0)
		next_dir = Vector2(0,0)