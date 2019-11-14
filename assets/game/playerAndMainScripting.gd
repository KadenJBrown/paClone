extends KinematicBody2D

var current_dir = Vector2(1,0)
var next_dir = null
var speed = 200
var framenum = 0

func _ready():
	hide()

func _process(delta):
	framenum += delta
	if int(framenum / 0.1) % 2 == 0:
		$Sprite.set_texture(preload("res://assets/image/pac.png"))
	else:
		$Sprite.set_texture(preload("res://assets/image/paClosed.png"))
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
		# Check if on next direction and move
		if next_dir != null:
			if !move_and_collide(next_dir*delta*speed):
				current_dir = next_dir
				next_dir = null
			else:
				move_and_collide(-(next_dir*delta*speed))
				move_and_collide(current_dir*delta*speed)
			position += current_dir * -1
		else:
			move_and_collide(current_dir*delta*speed)
			position += current_dir * -1
		# Turn
		if current_dir == Vector2(1,0):
			rotation_degrees = 0
		elif current_dir == Vector2(-1,0):
			rotation_degrees = 180
		elif current_dir == Vector2(0,1):
			rotation_degrees = 90
		elif current_dir == Vector2(0,-1):
			rotation_degrees = 270
		else:
			print("THIS SHOULD NEVER HAPPEN. "+str(current_dir))
		# Hyperspace
		if position.x < 0:
			position.x = 1044
		elif position.x > 1024:
			position.x = -20
		# Debug
		global.playerpos = position
	else:
		# Ready player data
		hide()
		position.x = 512
		position.y = 400
		current_dir = Vector2(1,0)
		next_dir = null
		framenum = 0