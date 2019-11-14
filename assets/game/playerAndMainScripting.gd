extends KinematicBody2D

var current_dir = Vector2(1,0)
var next_dir = null
var speed = 200
var framenum = 0
onready var music = $"/root/Game/Music"
onready var sfx = $"/root/Game/SFX"

func _ready():
	hide()

func _process(delta):
	if global.score == 0 && global.inGame == true:
		music.stop()
		sfx.stream = load("res://assets/sound/yay.wav")
		sfx.stop()
		sfx.play()
		global.inGame = null
		framenum = 0
	if global.inGame == null:
		global.inGame = false
	if global.inGame == true:
		if global.score == -1:
			global.score = 0
		show()
		# Animation
		framenum += delta
		if int(framenum / 0.1) % 2 == 0:
			$Sprite.set_texture(preload("res://assets/image/pac.png"))
		else:
			$Sprite.set_texture(preload("res://assets/image/paClosed.png"))
		# Find next direction
		if Input.is_action_just_pressed("ui_up") and current_dir != Vector2(0,1):
			next_dir = Vector2(0,-1)
		elif Input.is_action_just_pressed("ui_down") and current_dir != Vector2(0,-1):
			next_dir = Vector2(0,1)
		elif Input.is_action_just_pressed("ui_left") and current_dir != Vector2(1,0):
			next_dir = Vector2(-1,0)
		elif Input.is_action_just_pressed("ui_right") and current_dir != Vector2(-1,0):
			next_dir = Vector2(1,0)
		# Check if on next direction and move
		if next_dir != null:
			if !move_and_collide(next_dir*8,true,true,true):# && !move_and_collide(next_dir*-7.5,true,true,true):
				current_dir = next_dir
				next_dir = null
				move_and_collide(current_dir*delta*speed)
			else:
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
			position.x = 1024
		elif position.x > 1024:
			position.x = 0
		# Debug
		global.playerpos = position
		global.current = current_dir
		global.next = next_dir
	else:
		# Ready player data
		hide()
		position.x = 512
		position.y = 400
		current_dir = Vector2(1,0)
		next_dir = null
		framenum = 0
		global.score = -1