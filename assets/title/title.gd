extends Label

var disabled = false
onready var sfx = $"/root/Game/SFX"
onready var music = $"/root/Game/Music"

func soundPlay():
	sfx.stream = load("res://assets/sound/click.wav")
	sfx.stop()
	sfx.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	visible_characters = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if disabled == false:
		show()
		global.totalDeltaTitle += delta
		if visible_characters != 0:
			# [GLITCH]
			# 	visible_characters += int(floor(delta))
			# 		Looks at progress from last frame to now
			# 		floor(delta) usually is 0
			# 	visible_characters += int(floor(global.totalDeltaTitle))
			# 		Also adds seconds already passed
			# 		+= means increment, not set (=)
			visible_characters = int(floor((global.totalDeltaTitle-3)/0.1))
			if global.titleShown < visible_characters and global.titleShown <= 7:
				soundPlay()
			global.titleShown = visible_characters
		else:
			if global.totalDeltaTitle >= 3:
				visible_characters = 1
	else:
		visible_characters = 0
		hide()
		if global.inGame == false:
			disabled = false
			visible_characters = 0
			global.totalDeltaTitle = 0

func _on_startButton_pressed():
	disabled = true
	soundPlay()
	music.stream = load("res://assets/sound/paclonetheme.ogg")
	music.play()