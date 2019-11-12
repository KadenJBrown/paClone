extends Label

var disabled = false
var player = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	visible_characters = 0
	self.add_child(player)
	player.stream = load("res://assets/sound/click.wav")

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
				player.stop()
				player.play()
			global.titleShown = visible_characters
		else:
			if global.totalDeltaTitle >= 3:
				visible_characters = 1
	else:
		visible_characters = 0
		hide()

func _on_startButton_pressed():
	disabled = true
	player.stop()
	player.play()