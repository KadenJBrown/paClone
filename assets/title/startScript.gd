extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	disabled = true
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if global.totalDeltaTitle >= 5 && global.inGame == false:
		disabled = false
		show()

func _on_startButton_pressed():
	disabled = true
	hide()
	global.inGame = true